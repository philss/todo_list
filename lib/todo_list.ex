defmodule TodoList do
  @moduledoc """
  Documentation for TodoList.
  """

  import Ecto.Query

  def add_task(task) do
    changeset = TodoList.Task.changeset(%{"content" => task})
    TodoList.Repo.insert(changeset)
  end

  def list_tasks() do
    query = from t in TodoList.Task

    TodoList.Repo.all(query)
  end
end
