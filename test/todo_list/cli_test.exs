defmodule TodoList.CLITest do
  use TodoList.DataCase
  import ExUnit.CaptureIO

  alias TodoList
  alias TodoList.CLI

  test "main/1 prints help without args" do
    cli_io = capture_io(fn -> CLI.main([]) end)
    assert cli_io =~ "Usage:\n todo_list [options]"
    assert cli_io =~ "--task task-here: adds a new task"
  end

  test "main/1 with --task adds a new task" do
    assert TodoList.list_tasks() == []

    cli_io = capture_io(fn -> CLI.main(["--task", "Hello world"]) end)
    assert cli_io =~ "Task saved: Hello world"

    assert content(TodoList.list_tasks()) == ["Hello world"]

    cli_io = capture_io(fn -> CLI.main(["--task", "Hi"]) end)

    assert cli_io =~ "Validation error:"
    assert cli_io =~ "content: should be at least 5 character(s)"

    assert content(TodoList.list_tasks()) == ["Hello world"]

    cli_io = capture_io(fn -> CLI.main(["--list-tasks"]) end)

    assert cli_io =~ "Tasks:"
    assert cli_io =~ "- Hello world"
  end

  defp content(tasks) do
    Enum.map(tasks, fn(task) -> task.content end)
  end
end
