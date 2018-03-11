defmodule MergeSort do
  @moduledoc """
  Defines the outer splitting and sorting part of the merge sort algorithm.
  """

  @doc """
  MergeSort.sort takes in a list of numbers, and outputs that list of numbers,
  sorted in ascending order
  """

  @spec sort(list()) :: list()

  def sort([element]) do
    #the single element case
    [element]
    #simply return upwards the given element
  end
  
  def sort(list) do
    #all cases of two or more elements
    {left_list, right_list} = list
    |> Enum.split( length(list) |> div(2) )
    #split the input list into a tuple of two lists

    MergeJoin.join(sort(left_list), sort(right_list))
    #split, sort, and join recursively
  end
end
