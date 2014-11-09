module Api
  class SessionsController < Devise::SessionsController
    respond_to :json

    skip_before_action :verify_authenticity_token, if: :json_request?

    def create
      warden.authenticate!(scope: resource_name)
      @user = current_user
    end

    def destroy
      if user_signed_in?
        @user = current_user
        @user.authentication_token = nil
        @user.save
      else
        render 'failure'
      end
    end

    private

    def json_request?
      request.format.json?
    end
  end
end
