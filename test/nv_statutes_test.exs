import List

defmodule NvStatutesTest do
  use ExUnit.Case

  setup_all do
    html = File.read!("nrs.html")
    {
      :ok,
      html: html,
      first_title: first(NRS.titles(html))
    }
  end


  test "finds the correct number of titles", state do
    assert length(NRS.titles(state[:html])) == 59
  end


  test "gets the first title's name", state do
    assert state[:first_title].name == "STATE JUDICIAL DEPARTMENT"
  end


  test "gets the first title's number", state do
    assert state[:first_title].number == 1
  end
end
