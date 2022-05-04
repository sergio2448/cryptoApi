class User < ApplicationRecord
  has_many :transactions
  validates :email, presence: true
  validates :username, presence: true
  validates :btc, presence: true
  validates :usd, presence: true
  validates :password, presence: true
  validates :auth_token, presence: true

  after_initialize :generate_auth_token

  def generate_auth_token
    unless auth_token.present?
      self.auth_token = TokenGenerationService.generate
    end
  end
end
