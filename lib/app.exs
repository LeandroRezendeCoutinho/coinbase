["BTC-USD", "ETH-USD", "LTC-USD", "BCH-USD"]
|> Enum.map(fn product_id->
  spawn(fn -> Coinbase.print_price(product_id) end)
end)
