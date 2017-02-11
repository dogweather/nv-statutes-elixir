defmodule NRSTest do
  use ExUnit.Case
  doctest NRS

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "hello world" do
    assert :world == NRS.hello
  end

  test "finds the correct number of titles" do
    html = File.read!("nrs.html")
    assert 59 == NRS.title_count(html)
  end
end
