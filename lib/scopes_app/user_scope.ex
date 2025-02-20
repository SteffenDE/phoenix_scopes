defmodule ScopesApp.UserScope do
  @moduledoc false
  # Manually implemented demo scope!

  defstruct user: nil

  def new(id) do
    %__MODULE__{user: %{id: id}}
  end
end
