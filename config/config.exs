# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :todo_list, TodoList.Repo,
  database: "todo_list_repo",
  username: "postgres",
  password: "",
  hostname: "db"

config :todo_list, ecto_repos: [TodoList.Repo]
