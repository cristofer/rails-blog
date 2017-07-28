class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    locale = params[:locale]
    I18n.locale = (%w[es en].include?locale) ? locale : I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? params[:locale] : I18n.locale }
  end

  protected

  # configure permitted parameters for devise
  def configure_permitted_parameters
    added_attrs = %i[email password password_confirmation remember_me avatar avatar_cache]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
