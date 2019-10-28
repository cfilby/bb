defmodule BB.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Starts a worker by calling: Bb.Worker.start_link(arg)
      # {Bb.Worker, arg}
      # How does this work exactly?
      worker(Slack.Bot, [BB.Slack, [], Application.get_env(:slack, :api_token)])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BB.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
