require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    let(:name) { "simple name" }
    it "validate presence of required fields" do
      should validate_presence_of(:type_transaction)
      should validate_presence_of(:type_coin_send)
      should validate_presence_of(:type_coin_get)
      should validate_presence_of(:amont_to_send)
      should validate_presence_of(:amont_to_get)
      should validate_presence_of(:user_id)
    end
  end
end
