require IEx;

import Enum
import Title
import TitleGroup

defmodule NRS do

  def titles(index_html) do
    groups = content_rows(index_html)
    |> tail
    |> title_groups

    groups
    |> map(fn(group) -> group.title end)
    |> map(&new_title/1)
  end


  def title_groups(rows) when is_list(rows) do
    rows
    |> Enum.chunk_by(fn(row) -> is_title_row(row) end)
    |> Enum.chunk(2)
    |> Enum.map(fn(x) -> List.flatten(x) end)
    |> map(fn(list) -> %TitleGroup{title: List.first(list), chapters: tail(list)} end)
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


  defp content_rows(html) do
    Floki.find(html, ".MsoNormalTable tr")
  end


  defp is_title_row({_, _, tds}) do
    length(tds) == 1
  end


  defp tail(xs) when is_list(xs) do
    Enum.slice(xs, 1..-1)
  end
end
