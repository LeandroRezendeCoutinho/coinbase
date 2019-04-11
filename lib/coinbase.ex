defmodule Coinbase do
  @coinbase_url "https://api.pro.coinbase.com"

  def get_price(product_id) do
    url = "#{@coinbase_url}/products/#{product_id}/ticker"

    %{"price" => price} =
      HTTPoison.get!(url).body
      |> Jason.decode!()

    price
  end

  def print_price(product_id) do
    start = System.monotonic_time(:millisecond)

    price = get_price(product_id)

    stop = System.monotonic_time(:millisecond)
    time = (stop - start) / 1000
    IO.puts("#{product_id}: #{price}\ttime: #{time}s")
  end
end
