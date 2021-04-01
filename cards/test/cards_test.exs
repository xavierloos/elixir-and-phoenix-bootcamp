defmodule CardsTest do
  use ExUnit.Case
  doctest Cards
  
  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    # assert deck != Cards.shuffle(deck)
    refute deck == Cards.shuffle(deck)
  end
  # MAPS
  # iex(1)> colors = %{primary: "red"}
  # %{primary: "red"}
  # iex(2)> colors.primary
  # "red"
  # iex(3)> colors = %{primary: "red", secondary: "blue"}
  # %{primary: "red", secondary: "blue"}
  # iex(4)> colors.primary
  # "red"
  # iex(5)> colors.secondary
  # "blue"
  # iex(6)> color_secondary = colors.secondary
  # "blue"
  # iex(7)> color_secondary
  # "blue"
  # iex(8)> %{secondary: secondary_color} = colors
  # %{primary: "red", secondary: "blue"}
  # iex(9)> secondary_color
  # "blue"

end
