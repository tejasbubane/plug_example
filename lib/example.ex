defmodule Example do
  use Application
  require Logger

  def start(_type, _args) do
    port = Application.get_env(:plug_example, :cowboy_port, 8080)
    children = [
      {
        Plug.Adapters.Cowboy2,
        scheme: :http,
        plug: Example.Router,
        options: [port: port]
      }
    ]

    Logger.info("Started application on http://localhost:#{port}")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
