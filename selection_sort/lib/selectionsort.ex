defmodule SelectionSort do

  @doc """
  SelectionSort.sort/1 takes an unsorted list of numbers and returns that list sorted in
  ascending order
  """
  
  @spec sort(list()) :: list()
  
  def sort(list) do
    sort(list, [])
  end
  #entry point

  defp sort([], results) do
    results
  end
  #exit point

  defp sort(list, results) do
    {min, remaining} = List.pop_at(list, Which.which(:max, list))
    #using max rather than min means we don't need to Enum.reverse the final results
    #Note: index-based at functions are linear time in elixir
    sort(remaining, [min | results])
  end
  #recursion

end
