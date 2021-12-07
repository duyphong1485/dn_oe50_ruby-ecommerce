module SessionsHelper
  def log_in account
    session[:account_id] = account.id
  end

  def current_account
    @current_account ||= Account.find_by id: session[:account_id]
  end

  def current_account? account
    account == current_account
  end

  def logged_in?
    current_account.present?
  end

  def log_out
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
