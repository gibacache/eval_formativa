class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session
  before_filter :allow_iframe


  protected
  def allow_iframe
    response.headers.delete "X-Frame-Options"
  end
end
