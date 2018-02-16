class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # decode the base 64 encoded string within the header containing username & password
    User.find_by!(username:
      Base64.decode64(request.headers["HTTP_AUTHORIZATION"].split.last).split(':').first)
  end
  
end
