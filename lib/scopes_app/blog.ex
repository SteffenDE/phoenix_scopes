defmodule ScopesApp.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias ScopesApp.Repo

  alias ScopesApp.Blog.Post
  alias Foo.Accounts.UserScope

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts(scope)
      [%Post{}, ...]

  """
  def list_posts(%UserScope{} = user_scope) do
    Repo.all(from post in Post, where: post.user_id == ^user_scope.user.id)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(%UserScope{} = user_scope, id) do
    Repo.get_by!(Post, [id: id, user_id: user_scope.user.id])
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(%UserScope{} = user_scope, attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs, user_scope)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%UserScope{} = user_scope, %Post{} = post, attrs) do
    true = post.user_id == user_scope.user.id

    post
    |> Post.changeset(attrs, user_scope)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%UserScope{} = user_scope, %Post{} = post) do
    true = post.user_id == user_scope.user.id

    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%UserScope{} = user_scope, %Post{} = post, attrs \\ %{}) do
    true = post.user_id == user_scope.user.id

    Post.changeset(post, attrs, user_scope)
  end
end
