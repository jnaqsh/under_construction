class ApplicationController < ActionController::Base
  protect_from_forgery, with: :exceprion
  def method_name
    'hit there'
  end
end

