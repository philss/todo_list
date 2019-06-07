defmodule TodoList.Task do
  use Ecto.Schema

  import Ecto.Changeset

  schema "tasks" do
    field :content, :string

    timestamps()
  end

  def changeset(attrs) do
    %TodoList.Task{}
    |> cast(attrs, [:content])
    |> validate_required([:content])
    |> validate_length(:content, min: 5)
  end
end
