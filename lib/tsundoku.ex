defmodule Tsundoku.Application do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Tsundoku.HttpRouter,
        options: [port: 7000]
      )
    ]

    options = [strategy: :one_for_one, name: Tsundoku.Supervisor]
    Supervisor.start_link(children, options)
  end
end
