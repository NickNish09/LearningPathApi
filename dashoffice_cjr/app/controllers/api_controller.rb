class ApiController < ActionController::Base
    protect_from_forgery with: :null_session
    include AbstractController::Translation

    # before_action :authenticate_user_from_token!

    respond_to :json

    ##
    # User Authentication
    # Authenticates the user with OAuth2 Resource Owner Password Credentials Grant
    def authenticate_user_from_token!
        auth_token = request.headers['Authorization']


        if auth_token
            authenticate_with_auth_token auth_token
        else
            authentication_error
        end
    end

    def current_user
        @current_user ||= authenticate_token
    end

    private

    def authenticate_token
        authenticate_with_http_token do |token, options|
            @user = User.find_by(access_token: token)
            # if @user.nil?
            #     render json: {error: t('unauthorized')}, status: 401
            # end
            authenticate_with_auth_token(token)
        end
    end

    def authenticate_with_auth_token auth_token
        unless auth_token.include?(':')
            authentication_error
            return
        end


        # user = User.where(id: user_id).first
        user = User.where(access_token: auth_token).first

        if user && Devise.secure_compare(user.access_token, auth_token)
        # User can access
        sign_in user, store: false
        user
      else
        authentication_error
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
