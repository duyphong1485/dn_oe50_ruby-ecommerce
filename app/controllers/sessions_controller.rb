class SessionsController < ApplicationController
  def new; end

  def create
    account = Account.find_by email: params[:sessions][:email].downcase
    if account&.authenticate params[:sessions][:password]
      log_in account
      redirect_to account
    else
      flash.now[:danger] = t "accounts.invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
