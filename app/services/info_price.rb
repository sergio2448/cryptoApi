require 'json'
require 'net/http'

class InfoPrice
  def price
    begin
      url = URI('https://api.coindesk.com/v1/bpi/currentprice.json')
      res = Net::HTTP.get(url)
      info = JSON.parse(res)

      return info['bpi']['USD']['rate_float']
    rescue
      puts "There was an error"
      return nil
    end
  end
end