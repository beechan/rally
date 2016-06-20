class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # ここに少し追加してやったわ。澤田より。
  protect_from_forgery with: :exception
end
