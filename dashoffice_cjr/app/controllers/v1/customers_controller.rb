module V1
    class CustomersController < ApiController
        def index
            @customers = Customer.all
            render json: @customers, include: :projects
        end

        def create
            @customer = Customer.new(customer_params)
            if @customer.save
                render json: {msg: "Sucesso!"}, status: 200
            else
                render json: {error: t('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
            end
        end

        def destroy
            @customer = Customer.find params[:id]
            @customer.destroy

            render json: {msg: "Sucesso ao destruir!"}, status: 200
        end

        private

        def customer_params
            params.require(:customer).permit(:name, :email, :phone)
        end

    end
end
