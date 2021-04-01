defmodule Identicon.Image do
  # STRUCT: is a map used to store data in elixir
  # Has 2 advantages over Maps: 
  # 1- Assing default values and Additional compile time checking
  # 2- 
  defstruct hex: nil, color: nil, grid: nil, pixel: nil
end