defmodule Quicksort do
  def qsort(list) when length(list) < 2 do
    list
  end

  def qsort([pivot | remaining]) do
    qsort([], pivot, [], remaining)
  end

  defp qsort(left_side, pivot, right_side, []) do
    qsort(left_side) ++ [pivot] ++ qsort(right_side)
    ##pivot is a single number that needs to be wrapped in a list
    ##in order to concatenate correctly here
  end

  defp qsort(left_side, pivot, right_side, [examined | remaining]) do
    cond do
      examined > pivot -> qsort(left_side, pivot, [examined | right_side], remaining)
      examined <= pivot -> qsort([examined |left_side], pivot, right_side, remaining)
    end
  end

end
