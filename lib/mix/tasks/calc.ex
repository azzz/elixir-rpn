defmodule Mix.Tasks.Calc do
  use Mix.Task

  @shortdoc "Calculates given expression or a list of expressions"

  @moduledoc """
  Evaluates all given expressions and prints results.

  ### Example
      > mix calc "1 2 +"
      "1 2 +" = 3

      > mix calc "5 10 /" "3 3 * 9 -"
      "5 10 /" = 0.5
      "3 3 * 9 -" = 0
  """

  def run([]), do: nil

  def run(expressions) do
    Enum.map expressions, fn(exp) ->
      IO.puts "\"#{exp}\" = #{Rpn.calc exp}"
    end
  end
end
