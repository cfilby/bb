import Config

config :bb,
  http_port: System.get_env("PORT", "8080")
    |> String.to_integer()

config :slack,
  api_token: System.get_env("SLACK_API_TOKEN")
