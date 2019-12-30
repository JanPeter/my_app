import Config

db_host = System.get_env("DATABASE_HOST") || 
  raise """
  environment variable DATABASE_HOST is missing.
  """
db_database = System.get_env("DATABASE_DB") || "my_app_dev" 
db_username = System.get_env("DATABASE_USER") || "postgres" 
db_password = System.get_env("DATABASE_PASSWORD") || "postgres"
db_url = "ecto://#{db_username}:#{db_password}@#{db_host}/#{db_database}"

config :my_app, MyApp.Repo,
  url:  db_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base = System.get_env("SECRET_KEY_BASE") ||
  raise """
  environment variable SECRET_KEY_BASE is missing.
  You can generate one by calling: mix phx.gen.secret
  """

config :my_app, MyAppWeb.Endpoint,
  http: [:inet6, port: 4000],
  secret_key_base: secret_key_base
