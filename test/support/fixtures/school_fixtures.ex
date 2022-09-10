defmodule AcademicsManagers.SchoolFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AcademicsManagers.School` context.
  """

  @doc """
  Generate a signature.
  """
  def signature_fixture(attrs \\ %{}) do
    {:ok, signature} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> AcademicsManagers.School.create_signature()

    signature
  end

  @doc """
  Generate a student.
  """
  def student_fixture(attrs \\ %{}) do
    {:ok, student} =
      attrs
      |> Enum.into(%{
        age: 42,
        email: "some email",
        name: "some name",
        semester: 42,
        student_code: "some student_code"
      })
      |> AcademicsManagers.School.create_student()

    student
  end
end
