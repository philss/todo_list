defmodule TodoList.Repo.Migrations.AddTasksTable do
  use Ecto.Migration

  def change do
    create table("tasks") do
      add :content, :string, null: false

      timestamps()
    end
  end
end
