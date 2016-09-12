defmodule Stack do
  @moduledoc """
    Implements basic stack
  """

  @doc """
    Pushes a value to the tuple. Returns new tuple.
    ### Example
      iex> Stack.push {1,2,3}, 4
      {1,2,3,4}
  """
  def push(stack, value) when is_tuple(stack) do
    Tuple.append stack, value
  end

  @doc """
    fetches a value from top of the tuple.
    Returns tuple with two elements: value and new tuple.
    If stack is empty, return nil as value and empty typle as a stack.

    ### Example
      iex> Stack.pop {1,2,3}
      {3, {1,2}}

      iex> Stack.pop {}
      {nil, {}}
  """
  def pop({}), do: {nil, {}}

  def pop(stack) when is_tuple(stack) do
    i = tuple_size(stack) - 1
    value = elem stack, i
    stack = Tuple.delete_at stack, i
    {value, stack}
  end
end
