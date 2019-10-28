defmodule BB.Slack do
  use Slack

  def handle_connect(slack, state) do
    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    send_message("Hello world!", message.channel, slack)
    {:ok, state}
  end

  def handle_event(_, _, state), do: {:ok, state}

  def handle_info(_, _, state), do: {:ok, state}
end
