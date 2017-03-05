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


  test "gets a title's name", state do
    assert state[:first_title].name == "STATE JUDICIAL DEPARTMENT"
  end


  test "gets a title's number", state do
    assert state[:first_title].number == 1
  end


  test "reads a chapter correctly", state do
    assert length(state[:first_title].chapters) > 0
  end
end
