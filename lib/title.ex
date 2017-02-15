defmodule Title do
  @enforce_keys [:name, :number, :chapters]
  defstruct     [:name, :number, :chapters]
end
