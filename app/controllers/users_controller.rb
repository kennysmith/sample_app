class UsersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    plan = Plan.find(params[:plan_id])
    @user = plan.users.build
    @user.build_subscription
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      
      sign_in @user
      flash[:success] = "Welcome to the SendEvent!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    userparams = :plan_id

    if userparams == 0
      @user = current_user
      cancel @user 
    end
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
    @user = current_user
    user = current_user
    cu = Stripe::Customer.retrieve(user.stripe_customer_token)
    cu.cancel_subscription
    user.postsremaining = 0
    user.plan_id = 0
    user.save
    redirect_to users_path
  end



  private


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end