defmodule Rpn do
  @moduledoc """
    Implements Reverse Polish Notation calculator
  """

  @operators ["+", "-", "/", "*", "^"]

  @doc """
    Evaluates expression in Reverse-Polish-Notation
    Returns NaN if the expression is invalid

    ### Example
      iex> Rpn.calc "3 5 + 10 -"
      -2

      iex> Rpn.calc "3.5 2 *"
      7.0

      iex> Rpn.calc "1 +"
      NaN
  """

  def calc(expression) do
    tokens = expression |> tokenize
    tokens = Enum.map tokens, &normalize_token/1
    tokens |> process_tokens
  end

  defp tokenize(expression) do
    expression |> String.split
  end

  defmacrop is_operator?(token) do
    quote do
      unquote(token) in @operators
    end
  end

  defp normalize_token(token) do
    cond do
      String.match?(token, ~r/^\d+$/) -> String.to_integer(token)
      String.match?(token, ~r/^\d+\.\d+$/) -> String.to_float(token)
      is_operator?(token) -> token
    end
  end

  defp process_tokens(tokens, stack \\ [])
  defp process_tokens([], [result]), do: result

  defp process_tokens(tokens, [op, rt, lt | stack])
    when is_operator?(op) and is_number(rt) and is_number(lt) do
    result = apply_operator lt, rt, op
    process_tokens tokens, [result | stack]
  end

  defp process_tokens([token | tokens], stack) do
    process_tokens(tokens, [token | stack])
  end

  defp process_tokens(_, _), do: NaN

  defp apply_operator(lt, rt, "+"), do: lt + rt
  defp apply_operator(lt, rt, "-"), do: lt - rt
  defp apply_operator(lt, rt, "*"), do: lt * rt
  defp apply_operator(lt, rt, "/"), do: lt / rt
  defp apply_operator(lt, rt, "^"), do: :math.pow lt, rt
end
