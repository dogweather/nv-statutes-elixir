defmodule NRSTest do
  use ExUnit.Case
  doctest NRS

  setup_all do
    {:ok, html: File.read!("nrs.html")}
  end

  test "finds the correct number of titles", state do
    assert 59 == length(NRS.titles(state[:html]))
  end

  test "gets the first title's name", state do
    assert "STATE JUDICIAL DEPARTMENT" == List.first(NRS.titles(state[:html])).name
  end
end
