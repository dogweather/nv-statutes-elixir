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
    Floki.find(html, ".MsoNormalTable tr")
    |> length
  end
end
