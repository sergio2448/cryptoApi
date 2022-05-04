class CurrentpriceController < ApplicationController

  def price
    api_info = InfoPrice.new
    data = api_info.price
    response = {"response": data}
    render json: response
  end
end