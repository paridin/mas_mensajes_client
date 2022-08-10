defmodule MasMensajes.Client do
  @moduledoc """
  Access service functionality through Elixir functions,
  wrapping the underlying HTTP API calls.
  """
  require Logger

  defp route do
    :mas_mensajes
    |> Application.get_env(:route, "153")
    |> String.to_integer()
  end

  defp default_campaign_opts do
    %{
      encode: false,
      long_message: Application.get_env(:mas_mensajes, :long_message, false),
      route: route(),
      token: Application.get_env(:mas_mensajes, :token)
    }
  end

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
  }
  ```

  """
  def publish_sms_campaign(campaign, message, recipients, opts) when is_list(recipients) do
    %{encode: encode?, long_message: long_message?, route: route, token: token} =
      Map.merge(default_campaign_opts(), opts)

    payload = %{
      text: message,
      recipients: recipients,
      encode: encode?,
      long_message: long_message?,
      route: route,
      campaign_name: campaign
    }

    Logger.debug("send message using: #{inspect(payload, pretty: true)}")

    "/campaign"
    |> MasMensajes.Api.post(payload, [MasMensajes.Api.authorization_header(token)])
    |> response()
  end

  @deprecated "Use publish_sms_campaign/4 instead"
  def publish_sms_campaing(campaign, message, recipients, opts) when is_list(recipients) do
    publish_sms_campaign(campaign, message, recipients, opts)
  end

  defp response({200, answer}), do: {:ok, answer}
  defp response({_, %{error: error, reason: reason}}), do: {:error, "#{error}; #{reason}"}
  defp response({_, reason}), do: {:error, reason}
end
