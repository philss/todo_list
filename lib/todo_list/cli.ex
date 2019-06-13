defmodule TodoList.CLI do
  def main([]), do: print_help()

  def main(["--task", task]) do

    case TodoList.add_task(task) do
      {:ok, task} ->
        IO.puts("Task saved: #{task.content}")
      {:error, changeset} ->
        IO.puts("Validation error:")
        errors = traverse_errors(changeset)

        Enum.map(errors, fn({key, value}) ->
          IO.puts("#{key}: #{Enum.join(value, ", ")}")
        end)
    end
  end

  def main(["--list-tasks"]) do
    IO.puts("Tasks:")
    Enum.map(TodoList.list_tasks(), fn(task) ->
      IO.puts("- #{task.content}")
    end)
  end

  defp print_help() do
    IO.puts("Usage:\n todo_list [options]")
    IO.puts("--task task-here: adds a new task")
  end

  defp traverse_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
