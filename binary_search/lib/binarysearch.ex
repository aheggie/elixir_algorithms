defmodule BinarySearch do
  #I think this one has less space complexity
  #given that it doesn't create variables in search/1

  @moduledoc """
  Implements divide-and-conquer binary search.

  BinarySearch.search/1 returns the search term if found, or nil

  BinarySearch.is_in/1 wraps BinarySearch.search/1 to return true if found, or false.
  """

  @doc """
  BinarySearch.is_in/1 is a boolean wrapper around BinarySearch.search/1

  It takes a tuple of an ordered list of numbers and a number to search for,
  and returns true if the number is in the list and false if not.
  """

  @spec is_in({list(), number()}) :: boolean()

  def is_in({list, search_term}) do
    search_result = search({list, search_term})
    cond do
       search_result == search_term -> true
       search_result == nil -> false
    end
  end

  @doc """
  BinarySearch.search/1 takes a tuple of an ordered list of numbers,
  and a number to search for, and returns that number if it is in the list,
  otherwise returning nil
  """

  @spec search({list(), number()}) :: number()

  def search({[], _search_term}) do
    nil
  end
  #exit for term not in list

  def search({sorted_list, search_term}) do
    search(ListSplit.into_halves(sorted_list), search_term)
  end
  #entry

  defp search({left_list, [h | right_tail]}, search_term) do
    #accessing the last item of left_list is O(n) not O(1)
    #accessing the first item of right list is O(1)
    #
    #I avoid recursively running an O(n) operation on left_list
    #by only comparing with the first item of right_list
    #This works because list_halves called in the second clause of search/2
    #will split a one-element list in this way:
    # > list_halves([1])
    # > {[], [1]}
    #
    #-therefore, a valid list always ends up as the second argument here
    # 
    #in the instance where the search term is the last item checked OR not in the list
    #the final recursion of search/3 will produce these argument values:
    #
    # left_list = []
    # h = final_list_item_to_compare
    # right_tail = []
    # search_term = search_term
    #
    #if the final_list_item == search_term
    #then the function returns the term
    #
    #if the final_list_item < search_term
    #OR
    #if the final_list_item > search_term
    #we return search([], search_term) in both cases, triggering
    #the nil output of the first clause of search/2 above
    cond do
      h < search_term -> search({right_tail, search_term})
      #if the search term is greater than the head of the right list
      #we can discard the left list entirely

      h == search_term -> search_term
      #exit condition where search_term is in right_list
      h > search_term -> search({left_list, search_term})
      #if the search term is less than the head of the right list
      #we can discard the right list entirely
    end
  end
  #checking step
end
