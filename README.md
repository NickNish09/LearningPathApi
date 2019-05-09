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

- Alterar customers controller com module v1, extender de ApiController e funções:

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

```
rails g migration add_access_token_to_users access_token:string
```

- Adicionar no model User um after create

```
after_create :update_access_token!

def update_access_token!
    self.access_token = "#{Devise.friendly_token}"
    save
end
```

Adicionar metodo current_user ao api controller

```
def current_user
    @current_user ||= authenticate_token
end

private

def authenticate_token
    authenticate_with_http_token do |token, options|
        @user = User.find_by(access_token: token)
        if @user.nil?
            render json: {error: t('unauthorized')}, status: 401
        else
            render json: {usuário: @user.name}
        end
    end
end

```

- Criar sessions controller

```
rails g controller v1/sessions
```

- Atualizar sessions controller para criar login
```
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
```

- E rotas

```
namespace :v1, defaults: { format: :json } do
    resources :customers
    resource :login, only: [:create], controller: :sessions
end
```
