module SessionsHelper
  def log_in account
    session[:account_id] = account.id
  end

  def current_account
    @current_account ||= Account.find_by id: session[:account_id]
  end

  def logged_in
    current_account.present?
  end

  def log_out
    session.delete(:account_id)
    @current_account = nil
  end
end
