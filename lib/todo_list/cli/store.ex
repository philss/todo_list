defmodule TodoList.CLI.Store do
  use Agent

  def start_link(initial_tasks \\ []) do
    Agent.start_link(fn -> initial_tasks end, name: __MODULE__)
  end

  def tasks() do
    Agent.get(__MODULE__, fn(tasks_list) -> tasks_list end)
  end

  def add_task(task) do
    Agent.update(__MODULE__, fn(tasks_list) -> [task | tasks_list] end)
  end
end
