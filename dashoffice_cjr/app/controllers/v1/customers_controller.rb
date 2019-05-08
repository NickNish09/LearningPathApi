module V1
    class CustomersController < ApplicationController
        def index
            @customers = Customer.all
            render json: @customers, include: :projects
        end
    end
end
