defmodule SimpleEcommerce.Repo do
  use Ecto.Repo,
    otp_app: :simple_ecommerce,
    adapter: Ecto.Adapters.Postgres
end
