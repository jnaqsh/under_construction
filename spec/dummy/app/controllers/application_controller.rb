class ApplicationController < ActionController::Base
  protect_from_forgery, with: :exception
  def method_name
    'hit there'
  end
end
