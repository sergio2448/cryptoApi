class Transaction < ApplicationRecord
  belongs_to :user

  validates :type_transaction, presence: true
  validates :type_coin_send, presence: true
  validates :type_coin_get, presence: true
  validates :amont_to_send, presence: true
  validates :amont_to_get, presence: true
  validates :user_id, presence: true
end
