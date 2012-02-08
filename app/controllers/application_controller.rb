class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  def set_locale
    requested_locale = params[:locale] || session[:locale] || cookies[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'] || []
    I18n.locale = requested_locale[0..1]
  end
end
