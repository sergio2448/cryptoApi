class TransactionValidationService
  def self.validation(user, info_user)
    price_btc = InfoPrice.new
    data = price_btc.price

    if ((info_user["type_transaction"] == 'sell' && info_user["type_coin_send"] == 'usd') || (info_user["type_transaction"] == 'buy' && info_user["type_coin_get"] == 'btc'))

      if info_user["type_transaction"] == 'buy'
        # de bitcoin a dolar
        change1 = info_user["btc"].to_f * data # en dolares
        change2 = info_user["btc"].to_f # en bitcoins
      else
        change1 = info_user["usd"].to_f # en dolares
        # de dolar a bitcoin
        change2 = info_user["usd"].to_f / data # en bitcoin
      end

      if user.usd.to_f >= change1

        btc_update = user.btc.to_f + change2
        usd_update = user.usd.to_f - change1

        client = user.update(btc: btc_update, usd: usd_update)

        transaction = Transaction.create!(type_transaction: info_user["type_transaction"],
        type_coin_send: info_user["type_coin_send"],
        type_coin_get: info_user["type_coin_get"],
        amont_to_send: change1,
        amont_to_get: change2,
        user_id: user.id)

        resp = {message: "Succesful transaction"}

      else
        resp = {message: "Insufficient funds"}
      end
    elsif ((info_user["type_transaction"] == 'sell' && info_user["type_coin_send"] == 'btc') || (info_user["type_transaction"] == 'buy' && info_user["type_coin_get"] == 'usd'))

      if info_user["type_transaction"] == 'sell'
        # de bitcoin a dolar
        change1 = info_user["btc"].to_f * data # en dolares
        change2 = info_user["btc"].to_f # en bitcoins
      else
        change1 = info_user["usd"].to_f # en dolares
        # de dolar a bitcoin
        change2 = info_user["usd"].to_f / data # en bitcoin
      end

      if user.btc.to_f >= change2 

        btc_update = user.btc.to_f - change2
        usd_update = user.usd.to_f + change1

        client = user.update(btc: btc_update, usd: usd_update)

        transaction = Transaction.create!(type_transaction: info_user["type_transaction"],
        type_coin_send: info_user["type_coin_send"],
        type_coin_get: info_user["type_coin_get"],
        amont_to_send: change2,
        amont_to_get: change1,
        user_id: user.id)

        resp = {message: "Succesful transaction"}

      else
        resp = {message: "Insufficient funds"}
      end
    else 
      resp = {message: "Error, please try again later"}
    end
  end
end