defmodule Identicon do
  def main(input) do
    input
    |>hash_input
  end
  # convert the string that's  going to be passed into a series of unique numbers
  # iex(1)> hash = :crypto.hash(:md5, "banana")
  # <<114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65>>
  # iex(2)> Base.encode16(hash) 
  # "72B302BF297A228A75730123EFEF7C41"
  # iex(3)> :binary.bin_to_list(hash)
  # [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65]
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    # iex(1)> Identicon.main("Javier")
    # [171, 2, 252, 235, 150, 137, 17, 75, 28, 209, 132, 78, 69, 108, 6, 149]
  end

  # Generate the colors: to do this, just take the first three numbers on the list return in the hash which is a RGB form value
  # Each square in the Identicon grid has a number, if the number is ODD we will NOT color that square.


end
