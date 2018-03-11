defmodule MergeJoin do
	@moduledoc """
	This implements the joining part of the mergesort algorithm.
	"""

	@doc """
	MergeJoin.join takes two lists of numbers, each ALREADY SORTED in ascending order,
	and outputs a joined list of those two lists,
	itself also sorted in ascending order
	"""

	@spec join(list(), list()) :: list()

	def join(left_list, right_list) do
		join(left_list,right_list,[])
	end

	defp join([],[],result) do
		result
		|> Enum.reverse
	end

	defp join([left_head | left_tail], [], result) do
		join(left_tail, [], [left_head|result])
	end

	defp join([], [right_head | right_tail], result) do
		join([], right_tail, [right_head | result])
	end

	defp join([left_head | left_tail], [right_head | right_tail], result) do
		cond do
		  left_head <= right_head -> join(left_tail,
		  								  [right_head | right_tail],
		  								  [left_head | result])
		  right_head < left_head -> join([left_head | left_tail],
		  								 right_tail,
		  								 [right_head | result])
		    
		end
	end
end