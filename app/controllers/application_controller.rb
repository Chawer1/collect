class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  before_action :set_locale
  protect_from_forgery with: :exception

  def current_user?(user)
    user == current_user
  end

  helper_method :current_user?

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}.merge options
  end
end
