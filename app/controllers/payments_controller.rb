class PaymentsController < ApplicationController

  def edit
    @payment = current_user.payments.first
  end

  def update
    @payment = current_user.payments.first
    if @payment.update_attributes(params[:payment])
      redirect_to root_path, :notice => "Successfully Updated"
    end
  end
end
