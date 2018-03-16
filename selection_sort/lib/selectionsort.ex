defmodule SelectionSort do
  def sort(list) do
    sort(list, [])
  end

  defp sort([], results) do
    results
  end

  defp sort(list, results) do
    {min, remaining} = List.pop_at(list, Which.which(:max, list))
    #using max rather than min means we don't need to Enum.reverse the final results
    sort(remaining, [min | results])
  end
end
