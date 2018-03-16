defmodule BinarySearch do
  #this implementation is more complicated than I would like

  def search([], _search_term) do
    nil
  end
  #exit for term not in list

  def search(sorted_list, search_term) do
    {left_list, right_list} = list_halves(sorted_list)
    #split the list in two "halves" (of differing length if length(list) is odd)
    search(left_list, right_list, search_term)
  end
  #entry

  def search(left_list, [h | right_tail], search_term) do
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
      h < search_term -> search(right_tail, search_term)

      h == search_term -> search_term
      #exit condition where search_term is in right_list
      h > search_term -> search(left_list, search_term)
    end
  end
  #check

  def list_halves(list) do
    #split a list into two 'halves', in the case of an odd-length list
    #the first half is the shorter one
    Enum.split(list, div(length(list), 2))
  end

end
