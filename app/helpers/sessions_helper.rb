module SessionsHelper
  def log_in account
    session[:account_id] = account.id
    session[:account_fullname] = account.fullname
    flash[:success] = t "accounts.loggin_success"
  end

  def current_account
    @current_account ||= Account.find_by id: session[:account_id]
    if account_id = session[:account_id]
      @current_account ||= Account.find_by id: account_id
    elsif account_id = cookies.signed[:account_id]
      account = Account.find_by id: account_id
      if account&.authenticated? cookies[:remember_token]
        log_in account
        @current_account = account
      end
    end
  end

  def current_account? account
    account == current_account
  end

  def logged_in?
    current_account.present?
  end

  def remember account
    account.remember
    cookies.permanent.signed[:account_id] = account.id
    cookies.permanent[:remember_token] = account.remember_token
  end

  def forget account
    account.forget
    cookies.delete(:account_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_account)
    session.delete(:account_id)
    @current_account = nil
  end

  def save_back_url
    session[:back_url] = request.original_url if request.get?
  end

  def redirect_back_or default
    redirect_to session[:back_url] || default
    session.delete :back_url
  end
end
