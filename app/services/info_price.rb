require 'json'
require 'net/http'

class InfoPrice
  def price
    url = URI('https://api.coindesk.com/v1/bpi/currentprice.json')
    res = Net::HTTP.get(url)
    info = JSON.parse(res)

    return info['bpi']['USD']['rate_float']
  end
end