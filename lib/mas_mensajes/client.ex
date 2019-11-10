defmodule MasMensajes.Client do
  @moduledoc"""
  Access service functionality through Elixir functions,
  wrapping the underlying HTTP API calls.
  """
  @default_campaing_opts %{
    encode: false,
    long_message: true,
    route: 153,
    country: 1,
    token: Application.get_env(:mas_mensajes, :token)
  }

  def profile(token \\ nil) do
    "/user"
    |> MasMensajes.Api.get([], [MasMensajes.Api.authorization_header(token)])
    |> response()
  end

  @doc """
  It should create a new campaign id doesn't group by name

  In the future we can save the response to get statics

  ```
  # default options
  opts = %{
    encode: false,
    long_message: true,
    route: 153,
    country: 1,
  }
  ```

  """
  def send_to_campaing(campaign, message, recipients, opts) when is_list(recipients) do
    %{encode: encode?, long_message: long_message?, route: route, country: country, token: token} =
      Map.merge(@default_campaing_opts, opts)

    payload = %{
      text: message,
      recipients: recipients,
      encode: encode?,
      long_message: long_message?,
      route: route,
      country: country,
      campaign_name: campaign
    }

    "/campaign"
    |> MasMensajes.Api.post(payload, [MasMensajes.Api.authorization_header(token)])
    |> response()
  end

  defp response({200, answer}), do: {:ok, answer}
  defp response({_, %{error: error, reason: reason}}), do: {:error, "#{error}; #{reason}"}
  defp response({_, reason}), do: {:error, reason}
end


