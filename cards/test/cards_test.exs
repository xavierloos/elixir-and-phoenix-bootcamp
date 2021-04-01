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

  # UPDATING VALUES OF MAPS
  # iex(13)> colors = %{primary: "red"}
  # %{primary: "red"}
  # iex(14)> colors.primary = "blue"
  # ** (CompileError) iex:14: cannot invoke remote function colors.primary/0 inside a match
  # iex(14)> colors
  # %{primary: "red"}
  # iex(15)> Map.put(colors, :primary, "blue") //THIS DON'T MODIFY THE ORIGIINAL MAP
  # %{primary: "blue"}
  # iex(16)> colors
  # %{primary: "red"}
  # iex(17)> %{colors | primary: "blue"} //THIS DON'T MODIFY THE ORIGIINAL MAP
  # %{primary: "blue"}
  # iex(18)> colors
  # %{primary: "red"}
  # iex(19)> %{colors | secondary: "red"}
  # ** (KeyError) key :secondary not found in: %{primary: "red"}
  #     (stdlib 3.14.1) :maps.update(:secondary, "red", %{primary: "red"})
  #     (stdlib 3.14.1) erl_eval.erl:259: anonymous fn/2 in :erl_eval.expr/5
  #     (stdlib 3.14.1) lists.erl:1267: :lists.foldl/3 
  # iex(19)> Map.put(colors, :secondary, "green") //THIS DON'T MODIFY THE ORIGIINAL MAP
  # %{primary: "red", secondary: "green"}
  # iex(20)> colors
  # %{primary: "red"}
  # iex(21)> 

end
