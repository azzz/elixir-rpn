defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "pushes value to stack" do
    assert Stack.push({}, 1) == {1}
    assert Stack.push({1}, 2) == {1, 2}
  end

  test "pops value" do
    assert Stack.pop({}) == {nil, {}}
    assert Stack.pop({1}) == {1, {}}
    assert Stack.pop({1,2,3}) == {3, {1,2}}
  end
end
