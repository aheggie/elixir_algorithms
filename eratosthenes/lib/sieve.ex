defmodule Sieve do
  @moduledoc """
  Implementation of the sieve of Eratosthenes.
  """

  @doc """
  Sieve.primes_up_to/1 takes some positive integer n
  and returns a list of all primes from 2 until n .

  ## Examples

      iex> Sieve.primes_up_to(10)
      [2,3,5,7]

  """

  @spec primes_up_to(integer()) :: list()


  def primes_up_to(n) do
    primes_up_to(Enum.to_list(2..n), [])
  end

  defp primes_up_to([], result) do
    result
    |> Enum.reverse
  end

  defp primes_up_to([new_prime | tail], result) do
    tail
    |> remove_multiples_of(new_prime)
    # This filters out all multiples of the newly identified prime
    |> primes_up_to([new_prime | result])
  end

  defp remove_multiples_of(list, factor) do
    Enum.filter(list, fn(item) -> rem(item, factor) != 0 end)
    #note rem/2 is short for 'remainder' not 'remove'
    #i.e. it is the modulus function
  end
end
