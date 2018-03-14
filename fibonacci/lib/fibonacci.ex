defmodule Math do
  @moduledoc """
  Functions to return the nth fibonacci numbers,
  and a list of the n first fibonacci numbers
  """

  @spec fibonacci(integer()) :: integer()

  @doc """
  Given an integer n >= 0, this returns the nth fibonacci number.

  Note: this implementation presumes that the 0th fibonacci number is 0,
  the 1st is 1, and so on from there
  """

  def fibonacci(n) do
    inner_fibo(n)
    |> Enum.at(0)
  end

  defp inner_fibo(0) do
    [0]
  end

  defp inner_fibo(n) when n > 0 do
    #guard against negative numbers
    inner_fibo(n-1, [1,0])
  end

  defp inner_fibo(0, result) do
    result
  end

  defp inner_fibo(n, [first, second]) do
    inner_fibo(n-1, [first + second, first])
    #because we in fact only need to memoise two numbers per recursion
    #and can discard the rest of the earlier fibonacci sequence
    #this is much more space-efficient than fibo_list below
    #which grows the array with each recursion
  end

  @doc """
  Given an integer n, returns a list of the first n fibonacci numbers.

  Note: This function assumes desired output begins with the
  1st fibonacci number as in [1,1,2,...],
  rather than the 0th as in [0,1,1,2,...]

  """

  @spec fibo_list(integer()) :: list()

  def fibo_list(1) do
    [1]
  end
  #special clause for 1

  def fibo_list(n) when n > 1 do
    #guard to protect against negative numbers
    fibo_list(n-2, [1,1])
    #n-2 so fibo_list(2) outputs immediately
  end
  #entry point all other numbers greater than 1

  defp fibo_list(0, result) do
    result
    |> Enum.reverse
  end
  #output

  defp fibo_list(n, result) do
    fibo_list(n-1, [Enum.at(result, 0) + Enum.at(result, 1) | result])
    #the reult list also includes the neccesary info for the summation in the recursion
  end
  #recursion

end
