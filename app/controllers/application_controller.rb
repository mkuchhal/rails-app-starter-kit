class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # If you don't need to support communication with native mobile or desktop
  # apps, you may want to use :exception instead.
  protect_from_forgery with: :null_session

  before_action :set_sign_in_redirect

  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  protected

  # Sets where Devise should redirect on sign-in.
  # Works in conjunction with the 'authLinks' directive.
  def set_sign_in_redirect
    if (hash = params[:x_return_to]).present?
      session[:user_return_to] =
          "#{request.protocol}#{request.host_with_port}/##{hash}"
    end
  end

  # Responds with a 401 (:unauthorized) HTTP status code.
  def deny_access
    respond_to do |format|
      format.json {
        # Some schools of thought advocate the use of 404 (:not_found). See
        # http://www.bennadel.com/blog/2400-handling-forbidden-restful-requests-401-vs-403-vs-404.htm
        render json: {}, status: :unauthorized
      }
    end
  end
end
