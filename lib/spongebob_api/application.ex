defmodule SpongebobApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SpongebobApiWeb.Telemetry,
      # Start the Ecto repository
      SpongebobApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SpongebobApi.PubSub},
      # Start Finch
      {Finch, name: SpongebobApi.Finch},
      # Start the Endpoint (http/https)
      SpongebobApiWeb.Endpoint
      # Start a worker by calling: SpongebobApi.Worker.start_link(arg)
      # {SpongebobApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SpongebobApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpongebobApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
