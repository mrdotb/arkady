defmodule Arkady.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ArkadyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Arkady.PubSub},
      # Start the Endpoint (http/https)
      ArkadyWeb.Endpoint
      # Start a worker by calling: Arkady.Worker.start_link(arg)
      # {Arkady.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Arkady.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ArkadyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
