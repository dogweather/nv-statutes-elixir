import Enum
import Title

defmodule NRS do
  def titles(html) do
    title_rows(html)
    |> map(&new_title/1)
  end


  defp new_title(doc) do
    name = Floki.text(doc)
    |> String.split("—")
    |> Enum.at(1)
    |> String.trim

    number = Floki.text(doc)
    |> String.split("—")
    |> Enum.at(0)
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
