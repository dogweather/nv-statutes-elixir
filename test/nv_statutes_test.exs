defmodule NRSTest do
  use ExUnit.Case
  doctest NRS

  test "finds the correct number of titles" do
    html = File.read!("nrs.html")
    assert 59 == NRS.title_count(html)
  end

  test "gets the first title's name" do
    html = File.read!("nrs.html")
    assert "STATE JUDICIAL DEPARTMENT" == List.first(NRS.titles(html)).name
  end
end
