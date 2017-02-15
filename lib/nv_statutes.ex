import Enum
import Title

defmodule NRS do

  def titles(index_html) do
    title_rows(index_html)
    |> map(&new_title/1)
  end


  defp new_title(doc) do
    [number_column, name_column] = Floki.text(doc) |> String.split("—")

    name   = String.trim(name_column)
    number = number_column
    |> String.split
    |> Enum.at(1)
    |> String.to_integer

    %Title{name: name, number: number, chapters: []}
  end


  defp title_rows(html) do
    content_rows(html)
    |> filter(&is_title_row/1)
  end


  defp content_rows(html) do
    Floki.find(html, ".MsoNormalTable tr")
  end


  defp is_title_row({_, _, tds}) do
    length(tds) == 1
  end
end
