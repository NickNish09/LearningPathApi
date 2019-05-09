module V1
    class SessionsController < ApiController
        def current_user_data
            current_user
        end
        # POST /v1/login
        def create
            @user = User.find_for_database_authentication(email: params[:email])
            return invalid_login_attempt unless @user

            if @user.valid_password?(params[:password])
                #sign_in :user, @user
                @user.update_access_token!
                render json: @user.access_token, root: nil
            else
                invalid_login_attempt
            end
        end

        private

        def invalid_login_attempt
            warden.custom_failure!
            render json: {error: t('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
        end
    end
end
