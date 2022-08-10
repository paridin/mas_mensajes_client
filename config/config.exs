import Config

token =
  System.get_env("MAS_MENSAJES_TOKEN") ||
    Application.get_env(:mas_mensajes, :token) ||
    raise """
    environment variable MAS_MENSAJES_TOKEN is missing.
    For example: MAS_MENSAJES_TOKEN=eyJ0eXAi...OiJKV1QiLCJhbGci
    """

config :mas_mensajes,
  token: token
