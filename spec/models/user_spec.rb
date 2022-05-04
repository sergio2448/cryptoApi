require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    let(:name) { "simple name" }
    it "validate presence of required fields" do
      should validate_presence_of(:email)
      should validate_presence_of(:username)
      should validate_presence_of(:btc)
      should validate_presence_of(:usd)
      should validate_presence_of(:password)
    end

    it "validate relations" do
      should have_many(:transactions)
    end
  end
end

