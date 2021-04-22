defmodule MasMensajes do
  @moduledoc"""
  A client library for interacting with the MasMensajes API.

  The underlying HTTP calls and done through

      MasMensajes.Api

  If you need to hold state, then you can use the Worker GenServer in

      MasMensajes.Worker

  And client specific access should be placed in

      MasMensajes.Client

  Your client wrapper methods should be exposed here, using defdelegate,
  for example

      defdelegate do_something, to: MasMensajes.Client

  If you API is not complete, then you would also expose direct access to your
  API, or if you have state information (e.g. OAuth2 tokens), then use the Worker:

      defdelegate get(url, query_params \\ %{}, headers \\ []), to: MasMensajes.Api
      defdelegate post(url, body \\ nil, headers \\ []), to: MasMensajes.Api
      defdelegate call(url, method, body \\ "", query_params \\ %{}, headers \\ []), to: MasMensajes.Api
  """

  defdelegate profile, to: MasMensajes.Client
  defdelegate publish_sms_campaing(campaign, message, recipients, opts \\ %{}), to: MasMensajes.Client

end
