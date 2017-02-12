import Enum

defmodule NRS do
  def titles(html) do
    title_rows(html)
    |> map(&new_title/1)
  end


  def new_title(doc) do
    name = Floki.text(doc)
    |> String.split("—")
    |> Enum.at(1)
    |> String.trim

    %{ name: name }
  end


  def title_count(html) do
    title_rows(html)
    |> length
  end


  def title_rows(html) do
    content_rows(html)
    |> filter(&is_title_row/1)
  end


  def content_rows(html) do
    Floki.find(html, ".MsoNormalTable tr")
  end


  def is_title_row({_, _, tds}) do
    length(tds) == 1
  end
end
