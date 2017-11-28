defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world
  """
  def hello do
    :world
  end

  @doc """
  Return a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]
    
    #List.flatten( for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}" 
    #  end
    #end )
    #List.flatten(cards)
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  
  @doc """
  Divides a deck into a hand and the remainder of the deck

  The `hand-size` argument indicates how many cards should be in the hand.

  ## Examples 
      
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand 
      ["Ace of Spades"]
      
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  #def load(filename) do
  #  {status, binary} = File.read filename
  #  :erlang.binary_to_term binary
  #end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist" 
    end
  end

  def create_hand(hand_size) do
    #deck = Cards.create_deck 
    #deck = Cards.shuflle(deck)
    #hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
    #Cards.deal(Cards.shuffle(Cards.create_deck),hand_size)  
  end

end
