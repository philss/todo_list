use Mix.Config

config :todo_list, TodoList.Repo,
  database: "todo_list_test",
  username: "postgres",
  password: "",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn
