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
end
