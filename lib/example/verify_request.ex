defmodule Example.VerifyRequest do
  import Plug.Conn

  def init(options), do: options

  def call(%Plug.Conn{request_path: path} = conn, opts) do
    if path in opts[:paths] do
      verify_request!(conn, opts[:fields])
    else
      conn
    end
  end

  defp verify_request!(conn, fields) do
    verified =
      conn.body_params
      |> Map.keys()
      |> contains_fields?(fields)

    if verified do
      conn
    else
      conn |> send_resp(400, "Incomplete Request - check all params") |> halt()
    end
  end

  defp contains_fields?(keys, fields), do: Enum.all?(fields, &(&1 in keys))
end
