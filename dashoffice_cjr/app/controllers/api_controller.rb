class ApiController < ActionController::Base
    protect_from_forgery with: :null_session
    include AbstractController::Translation

    respond_to :json

    ##
    # User Authentication
    # Authenticates the user with OAuth2 Resource Owner Password Credentials Grant

    def current_user
        @current_user ||= authenticate_token
    end

    private

    def authenticate_token
        authenticate_with_http_token do |token, options|
            puts "TOEKn"
            puts token
            @user = User.find_by(access_token: token)
            if @user.nil?
                render json: {error: t('unauthorized')}, status: 401
            else
                render json: {usuário: @user.name}
            end
        end
    end

    ##
    # Authentication Failure
    # Renders a 401 error
    def authentication_error
      # User's token is either invalid or not in the right format
      render json: {error: t('unauthorized')}, status: 401  # Authentication timeout
    end
  end
