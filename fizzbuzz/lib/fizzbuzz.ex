defmodule FizzBuzz do
	@moduledoc """
	Implements FizzBuzz dynamically for any given two integers across a list of integers.
	"""

	@doc """
	Given a list of integers, a single Fizz integer, and a single Buzz integer,
	FizzBuzz.fizzbuzz_printer/3 prints fizzbuzz to console.

	it returns a list of [:ok, :ok, ...] the same length as the input list
	"""

	@spec fizzbuzz_printer(list(), non_neg_integer(), non_neg_integer()) :: list()

	def fizzbuzz_printer(list, fizz_int, buzz_int) do
		list
		|> fizzbuzz(fizz_int, buzz_int)
		|> list_printer()
	end

	@spec list_printer(list) :: list()

	defp list_printer(list) do
		list
		|> Enum.map(fn(item) -> IO.puts(item) end)
	end

	@doc """
	FizzBuzz.fizzbuzz_maker/2 is a higher-order function to make any fizzbuzz function with fixed
	Fizz and Buzz integers.
	"""

	@spec fizzbuzz_maker(non_neg_integer(), non_neg_integer()) :: function()

	def fizzbuzz_maker(fizz_int, buzz_int) do
		fn(list) -> fizzbuzz(list, fizz_int, buzz_int) end
	end

	@doc """
	Given a list of integers, a single Fizz integer, and a single Buzz integer,
	FizzBuzz.fizzbuzz/3 outputs a list with Fizz, Buzz, or FizzBuzz 
	replacing the correct multiples.
	"""

	@spec fizzbuzz(list(), non_neg_integer(), non_neg_integer()) :: list()

	def fizzbuzz(list, fizz_int, buzz_int) do
		list
		|> Enum.map(fn(item) -> fizzbuzz_step(item, fizz_int, buzz_int) end)
	end

	defp fizzbuzz_step(integer, fizz_int, buzz_int) do
		cond do
		  rem(integer, fizz_int) == 0 and rem(integer, buzz_int) == 0 -> "FizzBuzz"
		  rem(integer, buzz_int) == 0 -> "Buzz"
		  rem(integer, fizz_int) == 0 -> "Fizz"
		  true -> integer
		end
	end
end