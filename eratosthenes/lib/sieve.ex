defmodule Sieve do
  @moduledoc """
  Documentation for Sieve.
  """

  @doc """
  ## Examples

      iex> Sieve.primes_up_to(10)
      [2,3,5,7]

  """
  def primes_up_to(n) do
    primes_up_to(Enum.to_list(2..n), [])
  end

  defp primes_up_to([], result) do
    result
    |> Enum.reverse
  end

  defp primes_up_to([new_prime | tail], result) do
    tail
    |> Enum.filter(fn(item) -> rem(item, new_prime) != 0 end)
    |> primes_up_to([new_prime | result])
  end
end
