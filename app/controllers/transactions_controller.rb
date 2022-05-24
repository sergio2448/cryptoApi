class TransactionsController < ApplicationController
include Secured
  before_action :authenticate_user!, only: [:create, :update]

  def index
    @transaction = Transaction.where(user_id: params[:user_id])
    if !params[:search].nil? && params[:search].present?
      @transaction = TransactionSearchService.search(@transaction, params[:search])
    end
    render json: @transaction,  status: :ok
  end

  def show
    @transaction = Transaction.find(params[:id])
      render json: @transaction, status: :ok
  end

  def create
    @transaction = Current.user.transactions.create!(create_params)
    render json: @transaction, status: :created
  end

  def update
    @transaction = Current.user.transactions.find(params[:id])
    @transaction.update!(update_params)
    render json: @transaction, status: :ok
  end

  private

  def create_params
    params.require(:transaction).permit(
      :type_transaction,
      :type_coin_send,
      :type_coin_get,
      :amont_to_send,
      :amont_to_get,
      :user_id
    )
  end

  def update_params
    params.require(:transaction).permit(
      :type_transaction,
      :type_coin_send,
      :type_coin_get,
      :amont_to_send,
      :amont_to_get,
    )
  end
end