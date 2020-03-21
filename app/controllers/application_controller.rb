class ApplicationController < ActionController::Base
  add_flash_types :success, :danger
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
end
