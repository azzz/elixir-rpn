defmodule RpnTest do
  use ExUnit.Case
  doctest Rpn

  test "calculates valid expressions" do
    assert Rpn.calc("2 3 +") == 5
    assert Rpn.calc("2 3 *") == 6
    assert Rpn.calc("10 7 -") == 3
    assert Rpn.calc("10 5 /") == 2
    assert Rpn.calc("2 3 5 + *") == 16
    assert Rpn.calc("60 3 3 + /") == 10.0

    assert Rpn.calc("60 3 3 + / 5 *") == 50.0
    assert Rpn.calc("60 3 3 + / 5 * 9 -") == 41.0

    assert Rpn.calc("2 3 ^") == 8.0
    assert Rpn.calc("2 3 ^ 2 ^") == 64.0
  end

  test "returns NaN for invalid expressions" do
    assert Rpn.calc("3 + /") == NaN
    assert Rpn.calc("3 +") == NaN
    assert Rpn.calc("3 + 33") == NaN
  end
end
