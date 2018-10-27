class UsersController < ApplicationController
skip_before_action :authenticate_request, only: %i[login register]

  def login
    authenticate(params["email"], params["password"])
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def register
    @user = User.create(user_params)
   if @user.save
    response = { message: 'User created successfully'}
    render json: response, status: :created
   else
    render json: @user.errors, status: :bad
   end
  end

  def test
    @user = JsonWebToken.decode(request.headers["Authorization"])
    render json: {
          user: @user
        }
  end


  private

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)
    if command.success?
      @user = JsonWebToken.decode(command.result)
      render json: {
        access_token: command.result,
        message: 'Login Successful',
        user: @user
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end


  def user_params
    params.permit(:username, :email, :password, :first_name, :last_name, :category_id)
  end

  def token_params
    params.permit(:token)
  end

end
