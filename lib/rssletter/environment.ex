defmodule Rssletter.Environment do
  @env Mix.env()

  def secrets do
    Application.get_env(:rssletter, :secrets)[@env] || %{}
  end

  def put_application_secrets(secrets) do
    Application.put_env(:rssletter, :secrets, secrets)
    :ok
  end

  def decrypt_secrets() do
    master_key_path = Path.join("priv/secrets", "master.key")
    master_key_env_variable = "MASTER_KEY"
    secrets_path = System.get_env("SECRETS_PATH", "priv/secrets/secrets.yml.enc")

    if System.get_env(master_key_env_variable) || File.exists?(master_key_path) do
      key = System.get_env(master_key_env_variable) || File.read!(master_key_path)
      EncryptedSecrets.read!(key, secrets_path)
    else
      %{}
    end
  end
end
