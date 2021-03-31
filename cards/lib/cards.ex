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
  end
end
