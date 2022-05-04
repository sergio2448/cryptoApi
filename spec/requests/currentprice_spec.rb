require "rails_helper"

RSpec.describe "currentprice endpoint", type: :request do

  describe "GET /currentprice" do
    let(:name) { "simple name" }
    before {get '/currentprice'}

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(payload.class).to eq(Hash)
    end

    it "should return status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end