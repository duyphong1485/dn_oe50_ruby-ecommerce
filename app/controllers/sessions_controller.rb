class SessionsController < ApplicationController
  def new; end

  def create
    account = Account.find_by email: params[:sessions][:email].downcase
    if account&.authenticate params[:sessions][:password]
      log_in account
      redirect_to account
    else
      flash.now[:danger] = t "accounts.loggin_failed"
      render :new
    end
  end

  def destroy
    session[:cart] = nil
    log_out
    redirect_to root_url
  end
end
