class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  before_filter :has_plan, only: :new




  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @subscription = @user.subscriptions.first
  end

  def new
    @user = User.new
    plan_id = params[:plan_id] || params[:user][:plan_id]
    @plan = Plan.find(plan_id)
    @user = @plan.users.build
  end

  def create
    @plan = Plan.find(params[:user][:plan_id])
    
    @user = User.new(params[:user])
    @user.payments.build(params[:payment])
    @user.subscriptions.build(:plan_id => @plan.id, :status => "notverified", :eventsremaining => @plan.kisses)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the SendEvent!"
      redirect_to @user
    else
      render :new
    end
  rescue Stripe::StripeError => e
    logger.error e.message
    @payment.errors.add :base, e.message
    render :action => :new
  end

  def edit
    @user = User.find(params[:id])
    @subscription = @user.subscriptions.first
    @plan = @subscription.plan if @subscription.present?
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def upgrade
    @user = current_user
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def downgrade_confirm
    @user = current_user

  end

  def cancel
    user = current_user
    payment = user.payments.first
    payment.customer.cancel_subscription if payment.customer.subscription.present?
    subscription = user.subscriptions.first
    subscription.status = "cancelled"
    subscription.eventsremaining = 0
    subscription.plan_id = 0
    subscription.save
    redirect_to root_path
  end

  def has_plan
    if params[:plan_id].blank? 
      redirect_to plansandpricing_path
    end
  end

  private
  def correct_user
    @user = current_user
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end