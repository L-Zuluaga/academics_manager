defmodule AcademicsManagers.School.Signature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "signatures" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(signature, attrs) do
    signature
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
