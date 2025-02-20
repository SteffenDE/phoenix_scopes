defmodule ScopesApp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :user_id, references(:user, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end
  end
end
