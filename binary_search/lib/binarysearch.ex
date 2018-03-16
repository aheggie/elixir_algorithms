defmodule BinarySearch do
  def search(sorted_list, search_term) do
    search(list_halves(sorted_list), search_term)
  end

  def search({left_list, right_list}, search_term) do
    IO.puts(left_list)
    IO.puts(right_list)
  end

  def list_halves(list) do
    Enum.split(list, div(length(list), 2))
  end

end
