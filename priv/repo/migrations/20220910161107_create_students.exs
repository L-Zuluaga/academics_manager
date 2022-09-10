defmodule AcademicsManagers.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :student_code, :string
      add :name, :string
      add :email, :string
      add :semester, :integer
      add :age, :integer

      timestamps()
    end
  end
end
