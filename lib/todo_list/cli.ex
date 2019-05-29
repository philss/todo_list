defmodule TodoList.CLI do
  def main([]), do: print_help()

  def main(["--task", task]) do
    TodoList.CLI.Store.add_task(task)
  end

  defp print_help() do
    IO.puts("Usage:\n todo_list [options]")
    IO.puts("--task task-here: adds a new task")
  end
end
