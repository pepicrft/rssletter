defmodule Rssletter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RssletterWeb.Telemetry,
      Rssletter.Repo,
      {DNSCluster, query: Application.get_env(:rssletter, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Rssletter.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Rssletter.Finch},
      # Start a worker by calling: Rssletter.Worker.start_link(arg)
      # {Rssletter.Worker, arg},
      # Start to serve requests, typically the last entry
      RssletterWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rssletter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RssletterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
