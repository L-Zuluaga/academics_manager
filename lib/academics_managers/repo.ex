defmodule AcademicsManagers.Repo do
  use Ecto.Repo,
    otp_app: :academics_managers,
    adapter: Ecto.Adapters.Postgres
end
