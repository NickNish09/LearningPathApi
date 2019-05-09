# LearningPathApi

## Passo a passo
- Gerar controller de API

```
rails g controller api
```

Adicionar no api controller:

```
protect_from_forgery with: :null_session
include AbstractController::Translation

respond_to :json
    
```

- Gerar controller dentro do escopo v1 para crud de clientes:

```
rails g controller v1/customers
```

adicionar nos routes as rotas para api:

```
namespace :v1, defaults: { format: :json } do
   resources :customers
end
```

- Alterar customers controller com module v1 e funções:

```
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
```

- Testar no Postman

## Login por API

- Adicionar access_token para usuário e função para setar isso no model
