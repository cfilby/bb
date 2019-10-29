defmodule BB.RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias BB.Router

  setup do
    [opts: Router.init([])]
  end

  test "returns hello", %{opts: opts} do
    conn =
      :get
      |> conn("/", "")
      |> Router.call(opts)

    assert conn.status == 200
    assert conn.resp_body == "hello"
  end
end
