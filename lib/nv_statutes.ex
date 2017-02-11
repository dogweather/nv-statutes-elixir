import Enum

defmodule NRS do
  @moduledoc """
  Documentation for NRS.
  """

  @doc """
  Hello world.

  ## Examples

      iex> NRS.hello
      :world

  """
  def hello do
    :world
  end


  def title_count(html) do
    content_rows(html)
    |> Enum.filter(&is_title_row/1)
    |> length
  end


  def content_rows(html) do
    Floki.find(html, ".MsoNormalTable tr")
  end


  def is_title_row({_, _, tds}) do
    length(tds) == 1
  end
end
