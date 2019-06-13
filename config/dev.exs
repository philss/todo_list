use Mix.Config

config :todo_list, TodoList.Repo,
  database: "todo_list_repo",
  username: "postgres",
  password: "",
  hostname: "db"

config :logger, level: :info
