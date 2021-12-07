class AccountsController < ApplicationController
  before_action :logged_in, except: %i(show new create)
  before_action :load_account_or_redirect, only: %i(show edit update)
  before_action :correct_account, only: %i(show edit update)
  include SessionsHelper
  def new
    @account = Account.new
  end

  def show; end

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

  def update
    if @account.update(account_params)
      flash[:success] = t "account_updated_html", accountname: @account.fullname
      redirect_to @account
    else
      render :edit
    end
  end

  def edit; end

  private

  def account_params
    params
      .require(:account).permit(:fullname, :email, :password, :password_confirmation)
  end

  def logged_in
    return if logged_in?

    save_back_url
    flash[:danger] = t "login_first"
    redirect_to login_url
  end

  def load_account_or_redirect
    @account = Account.find_by id: params[:id]
    return if @account

    flash[:danger] = t "accounts.danger"
    redirect_to login_url
  end

  def correct_account
    redirect_to(root_url) unless current_account?(@account)
  end
end
