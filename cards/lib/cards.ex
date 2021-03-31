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
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
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
  def deal(deck, hand_size) do
     Enum.split(deck, hand_size)
      # iex(16)> Cards.deal(deck, 3)
      # {["Ace of Spade", "Two of Spade",
      #   "Three of Spade"],
      #  ["Four of Spade", "Five of Spade",
      # "Ace of Clubs", "Two of Clubs",
      # "Three of Clubs", "Four of Clubs",
      # "Five of Clubs", "Ace of Hearts",
      # "Two of Hearts", "Three of Hearts",
      # "Four of Hearts", "Five of Hearts",
      # "Ace of Dimonds", "Two of Dimonds",
      # "Three of Dimonds", "Four of Dimonds",
      # "Five of Dimonds"]}

      # PATHER MATCHING
      # iex(17)> {hand, rest_of_deck}=Cards.deal(deck,5)
      # {["Ace of Spade", "Two of Spade",
      #   "Three of Spade", "Four of Spade",
      #   "Five of Spade"],
      #  ["Ace of Clubs", "Two of Clubs",
      #   "Three of Clubs", "Four of Clubs",
      #   "Five of Clubs", "Ace of Hearts",
      #   "Two of Hearts", "Three of Hearts",
      #   "Four of Hearts", "Five of Hearts",
      #   "Ace of Dimonds", "Two of Dimonds",
      #   "Three of Dimonds", "Four of Dimonds",
      #   "Five of Dimonds"]}
      # iex(18)> hand
      # ["Ace of Spade", "Two of Spade",
      #  "Three of Spade", "Four of Spade",
      #  "Five of Spade"]
      # iex(19)> rest_of_deck
      # ["Ace of Clubs", "Two of Clubs",
      #  "Three of Clubs", "Four of Clubs",
      #  "Five of Clubs", "Ace of Hearts",
      #  "Two of Hearts", "Three of Hearts",
      #  "Four of Hearts", "Five of Hearts",
      #  "Ace of Dimonds", "Two of Dimonds",
      #  "Three of Dimonds", "Four of Dimonds",
      #  "Five of Dimonds"]
  end
  def save(deck, filename)do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  def load(filename) do
    case File.read(filename) do
      {:ok,binary }-> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
    # Cards.load('my_deck')
    #  iex(25)> Cards.load('wrong_file') 
    # "That file does not exist"
  end
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
    # Cards.create_hand(5)
  end
end
