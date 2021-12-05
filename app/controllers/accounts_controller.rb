class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def show
    @account = Account.find_by id: params[:id]
    return if @account

    flash[:danger] = t "accounts.danger"
    redirect_to login_url
  end

  def create
    @account = Account.new account_params
    if @account.save
      flash[:success] = t "accounts.success"
      redirect_to @account
    else
      flash[:success] = t "accounts.failed"
      render :new
    end
  end

  private

  def account_params
    params
      .require(:account).permit(:fullname, :email, :password, :password_confirmation)
  end
end
