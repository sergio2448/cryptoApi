FactoryBot.define do
  factory :transaction do
    type_transaction { "sell" }
    type_coin_send { "USD" }
    type_coin_get { "BTN" }
    amont_to_send { "9.99" }
    amont_to_get { "9.99" }
    user
  end

  factory :published_transaction, class: 'Transaction' do
    type_transaction { "sell" }
    type_coin_send { "USD" }
    type_coin_get { "BTN" }
    amont_to_send { "9.99" }
    amont_to_get { "9.99" }
    user
  end
end
