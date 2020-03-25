import Config

token = System.get_env("MAS_MENSAJES_TOKEN") ||
  Application.get_env(:mas_mensajes, :token) ||
  raise """
  environment variable MAS_MENSAJES_TOKEN is missing.
  For example: MAS_MENSAJES_TOKEN=eyJ0eXAi...OiJKV1QiLCJhbGci
  """

config :mas_mensajes,
  token: token
# And access this configuration in your application as:
#
#     Application.get_env(:mas_mensajes, :token)
#
# Or configure a 3rd-party app:
#
#     config(:logger, level: :info)
#

# Example per-environment config:
#
import_config("#{Mix.env}.exs")
