defmodule Which do

  def which(min_max, list) do
  	case min_max do
  	   :min -> which_min(list)
  	   :max -> which_max(list)
  	end
  end

  @doc """
  which_min takes a list of numbers and returns the index of the smallest number
  """

  @spec which_min(list()) :: non_neg_integer()

  def which_min(list) do
    list |>
    Enum.find_index(fn(x) -> x == find_smallest(list) end)
  end

  @doc """
  which_max takes a list of numbers and returns the index of the smallest number
  """

  @spec which_max(list()) :: non_neg_integer()

  def which_max(list) do
    list |>
    Enum.find_index(fn(x) -> x == find_largest(list) end)
  end

  @doc """
  find_smallest takes in a list of numbers and then returns the smallest number in that list.
  """

  @spec find_smallest(list()) :: number()

  def find_smallest(list) do
    Enum.reduce(list, fn(current_item, previous_smallest) -> choose_smallest(current_item, previous_smallest) end)
    #the reducing function chooses the smallest of the input and the accumulator
    #the accumulator thus holds the smallest value in the list
  end

  defp choose_smallest(a,b) do
    #chooses the smaller of two inputs
    cond do
      a <= b -> a
      b < a -> b
    end
  end
  
  @doc """
  find_largest takes in a list of numbers and then returns the largest number in that list.
  """

  @spec find_largest(list()) :: number()

  def find_largest(list) do
    Enum.reduce(list, fn(current_item, previous_smallest) -> choose_largest(current_item, previous_smallest) end)
    #the reducing function chooses the smallest of the input and the accumulator
    #the accumulator thus holds the smallest value in the list
  end

  defp choose_largest(a,b) do
    #chooses the smaller of two inputs
    cond do
      a >= b -> a
      b > a -> b
    end
  end
end