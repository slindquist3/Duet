class ApplicationController < ActionController::API
 before_action :authenticate_user

 def authenticate_user
   render json: {error: "unauthorized user!!!"} unless signed_in?
 end

 def signed_in?
   !!current_user
 end

 def current_user
   User.find(Auth.decode(request.env["HTTP_AUTHORIZATION"])["user_id"]) if request.env["HTTP_AUTHORIZATION"].present?
 end
end
