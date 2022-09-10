defmodule AcademicsManagers.Repo.Migrations.CreateSignatures do
  use Ecto.Migration

  def change do
    create table(:signatures) do
      add :name, :string
      add :description, :text

      timestamps()
    end
  end
end
