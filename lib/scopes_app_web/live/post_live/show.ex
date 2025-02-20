defmodule ScopesAppWeb.PostLive.Show do
  use ScopesAppWeb, :live_view

  alias ScopesApp.Blog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Post {@post.id}
      <:subtitle>This is a post record from your database.</:subtitle>
      <:actions>
        <.link class={button_classes()} navigate={~p"/posts/#{@post}/edit?return_to=show"}>
          Edit post
        </.link>
      </:actions>
    </.header>

    <.list>
      <:item title="Title">{@post.title}</:item>
      <:item title="Body">{@post.body}</:item>
    </.list>

    <.back navigate={~p"/posts"}>Back to posts</.back>
    """
  end

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Show Post")
     |> assign(:post, Blog.get_post!(socket.assigns.current_scope, id))}
  end
end
