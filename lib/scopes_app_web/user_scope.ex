defmodule ScopesAppWeb.UserScope do
  @moduledoc false

  def assign_scope(conn, _params) do
    id =
      case Plug.Conn.get_session(conn, :user_id) do
        nil ->
          System.unique_integer()

        id ->
          id
      end

    conn
    |> Plug.Conn.put_session(:user_id, id)
    |> Plug.Conn.assign(:current_scope, %ScopesApp.UserScope{user: %{id: id}})
  end

  def on_mount(:assign_scope, _params, %{"user_id" => id}, socket) do
    {:cont, Phoenix.Component.assign(socket, :current_scope, %ScopesApp.UserScope{user: %{id: id}})}
  end
end
