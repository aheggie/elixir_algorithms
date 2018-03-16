defmodule Unsorted do
	@moduledoc """
	Functions to generate unsorted lists of integers, as input to sorting algorithms
	"""

	@doc """
	unsorted give an unsorted list of random integers.
	Under the hood it maps n times over :rand.uniform/1

	Unsorted.unsorted/0 gives a list of ten integers between one and 1000

	Unsorted.unsorted/1 gives a list of n integers between one and 1000

	Unsorted.unsorted/2 gives a list of n integers between one and m
	"""

	@spec unsorted() :: list()

	def unsorted() do
		unsorted(10, 1000)
	end

	@spec unsorted(integer()) :: list()

	def unsorted(n) do
		unsorted(n, 1000)
	end

	@spec unsorted(integer(), integer()) :: list()

	def unsorted(n, m) do
		Enum.map(1..n, fn(_num) -> :rand.uniform(m) end)
	end
end