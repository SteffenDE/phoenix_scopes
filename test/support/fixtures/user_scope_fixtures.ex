defmodule ScopesApp.UserScopeFixtures do
  alias ScopesApp.UserScope

  def user_scope_fixture do
    %UserScope{user: %{id: System.unique_integer()}}
  end
end
