defmodule MergeSplit do

	def split(list) do
		split(list,[])
	end

	defp split([], results) do
		results
		|> Enum.reverse
	end

	defp split([head|tail], results) do
		split(tail, [[head]|results])
	end
end