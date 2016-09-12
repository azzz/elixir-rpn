defmodule Rvn do
  @moduledoc """
    Implements Reverse Polish Notation calculator
  """

  @doc """
    Evaluates expression in Reverse-Polish-Notation
    Returns NaN if the expression is invalid

    ### Example
      iex> Rvn.calc "3 5 + 10 -"
      -2

      iex> Rvn.calc "1 +"
      NaN
  """
  def calc(expression) do
    expression |> tokenize |> process_tokens
  end

  defp tokenize(expression) do
    expression |> String.split
  end

  defmacrop is_operator?(token) do
    quote do
      unquote(token) in ["+", "-", "/", "*"]
    end
  end

  defp normalize_token(token) when is_operator?(token), do: token
  defp normalize_token(token), do: String.to_integer(token)

  defp process_tokens(tokens, stack \\ {})

  defp process_tokens([], {result}), do: result
  defp process_tokens([], stack) do
    process_stack([], stack)
  end

  # defp process_tokens([], stack), do: process_stack([], stack)
  defp process_tokens([token | tokens], stack) do
    token = token |> normalize_token
    process_stack(tokens, Stack.push(stack, token))
  end

  defp extract_tokens(stack) do
    {operator, stack} = Stack.pop(stack)
    {right, stack} = Stack.pop(stack)
    {left, stack} = Stack.pop(stack)

    {left, right, operator, stack}
  end

  defp process_stack([], stack) do
    {left, right, operator, _} = extract_tokens(stack)

    result = apply_if_available left, right, operator
    if result, do: process_tokens([], {result}), else: NaN
  end

  defp process_stack(tokens, stack) do
    {left, right, operator, new_stack} = extract_tokens(stack)

    result = apply_if_available left, right, operator
    if result do
      process_tokens(tokens, Stack.push(new_stack, result))
    else
      process_tokens tokens, stack
    end
  end

  defp apply_operator(left, right, "+"), do: left + right
  defp apply_operator(left, right, "-"), do: left - right
  defp apply_operator(left, right, "*"), do: left * right
  defp apply_operator(left, right, "/"), do: left / right

  defp apply_if_available(left, right, operator) do
    if is_operator?(operator) && is_number(left) && is_number(right) do
      apply_operator left, right, operator
    else
      nil
    end
  end
end
