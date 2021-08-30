defmodule SimpleEcommerce.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SimpleEcommerce.Repo,
      # Start the Telemetry supervisor
      SimpleEcommerceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SimpleEcommerce.PubSub},
      # Start the Endpoint (http/https)
      SimpleEcommerceWeb.Endpoint
      # Start a worker by calling: SimpleEcommerce.Worker.start_link(arg)
      # {SimpleEcommerce.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleEcommerce.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SimpleEcommerceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
