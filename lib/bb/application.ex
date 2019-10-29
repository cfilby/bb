defmodule BB.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Bb.Worker.start_link(arg)
      # {Bb.Worker, arg}
      Plug.Cowboy.child_spec(scheme: :http, plug: BB.Router, options: [port: Application.get_env(:bb, :http_port)])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BB.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
