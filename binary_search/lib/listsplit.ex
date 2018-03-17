defmodule ListSplit do
  @moduledoc """
  Defines helper function to split lists in half in binary search
  """

  @doc """
  ListSplit.into_halves/1 is a wrapper around Enum.split/2 that takes a list and splits
  that list at its halfway point into a tuple of two half-length lists

  Note: In cases where the input length of the list is odd, the first half is
  the shorter one.
  """

  @spec into_halves(list()) :: {list(), list()}

  def into_halves(list) do
    #split a list into two 'halves', in the case of an odd-length list
    #the first half is the shorter one
    Enum.split(list, div(length(list), 2))
  end

end