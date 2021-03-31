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
    values = ["Ace","Two","Three","Four","Five"]
    suits = ["Spade","Clubs","Hearts","Dimonds"]
    # list comprehensions
    # wrong way to do it
    for value <- values do
      for suit <- suits do
        "#{value} of #{suit}"
      end
    end
    # iex(5)> Cards.create_deck
    # ["Spade", "Clubs", "Hearts", "Dimonds"] 
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
