defmodule AcademicsManagers.School.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :age, :integer
    field :email, :string
    field :name, :string
    field :semester, :integer
    field :student_code, :string

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:student_code, :name, :email, :semester, :age])
    |> validate_required([:student_code, :name, :email, :semester, :age])
  end
end
