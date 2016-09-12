defmodule RvnTest do
  use ExUnit.Case
  doctest Rvn

  test "calculates valid expressions" do
    assert Rvn.calc("2 3 +") == 5
    assert Rvn.calc("2 3 *") == 6
    assert Rvn.calc("10 7 -") == 3
    assert Rvn.calc("10 5 /") == 2
    assert Rvn.calc("2 3 5 + *") == 16
    assert Rvn.calc("60 3 3 + /") == 10.0

    assert Rvn.calc("60 3 3 + / 5 *") == 50.0
    assert Rvn.calc("60 3 3 + / 5 * 9 -") == 41.0
  end

  test "returns NaN for invalid expressions" do
    assert Rvn.calc("3 + /") == NaN
    assert Rvn.calc("3 +") == NaN
    assert Rvn.calc("3 + 33") == NaN
  end
end
