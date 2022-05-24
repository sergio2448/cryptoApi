class UserController < ApplicationController
  attr_accessor :email, :username, :btc, :usd, :auth_token

  def create
    @user = User.create!(create_params)
    render json: @user, status: :created
    session[:auth_token] = @user.auth_token
  end

  def show
    @user = User.find_by(validate_params)
    properties = {id: @user.id, email: @user.email, username: @user.username, btc: @user.btc, usd: @user.usd, auth_token: @user.auth_token, created_at: @user.created_at, updated_at: @user.updated_at}
    render json: properties, status: :ok
  end

  def update
    @user = User.find(params[:id])
    @people = TransactionValidationService.validation(@user, params[:user])
    response = {message: @people[:message]}
    render json: response, status: :ok
  end

  private

  def create_params
    params.require(:user).permit(
      :email,
      :username,
      :btc,
      :usd,
      :password,
      :auth_token
    )
  end

  def validate_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
end