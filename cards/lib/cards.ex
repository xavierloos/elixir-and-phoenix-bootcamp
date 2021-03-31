defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck do
    ["Ace","Two","Three"]
  end
  def shuffle(deck) do
    Enum.shuffle(deck)
    # in the shell
    # deck = Cards.create_deck
    # Cards.shuffle(deck)
    # deck var will still be the same as ["Ace","Two","Three"] just using shuffle won't modify the deck variable, this is callED IMMUTABILITY
  end
  def contains?(deck, card) do
    Enum.member?(deck, card)
    # iex(1)> deck = Cards.create_deck
    # ["Ace", "Two", "Three"]
    # iex(2)> Cards.contains?(deck,"Two")
    # true
    # iex(3)> Cards.contains?(deck,"Nine") 
    # false
  end
end
