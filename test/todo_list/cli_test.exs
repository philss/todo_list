defmodule TodoList.CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias TodoList.CLI

  test "main/1 prints help without args" do
    cli_io = capture_io(fn -> CLI.main([]) end)
    assert cli_io =~ "Usage:\n todo_list [options]"
    assert cli_io =~ "--task task-here: adds a new task"
  end

  test "main/1 with --task adds a new task" do
    assert CLI.Store.tasks() == []

    CLI.main(["--task", "Hello world"])

    assert CLI.Store.tasks() == ["Hello world"]
  end
end
