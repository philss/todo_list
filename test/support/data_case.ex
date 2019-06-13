defmodule TodoList.DataCase do
  use ExUnit.CaseTemplate

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TodoList.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(TodoList.Repo, {:shared, self()})
    end

    :ok
  end
end
