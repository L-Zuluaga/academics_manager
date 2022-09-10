defmodule AcademicsManagers.School do
  @moduledoc """
  The School context.
  """

  import Ecto.Query, warn: false
  alias AcademicsManagers.Repo

  alias AcademicsManagers.School.Signature

  @doc """
  Returns the list of signatures.
  ## Examples
      iex> list_signatures()
      [%Signature{}, ...]
  """
  def list_signatures do
    Repo.all(Signature)
  end

  @doc """
  Gets a single signature.
  Raises `Ecto.NoResultsError` if the Signature does not exist.
  ## Examples
      iex> get_signature!(123)
      %Signature{}
      iex> get_signature!(456)
      ** (Ecto.NoResultsError)
  """
  def get_signature!(id), do: Repo.get!(Signature, id)

  @doc """
  Creates a signature.
  ## Examples
      iex> create_signature(%{field: value})
      {:ok, %Signature{}}
      iex> create_signature(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_signature(attrs \\ %{}) do
    %Signature{}
    |> Signature.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a signature.
  ## Examples
      iex> update_signature(signature, %{field: new_value})
      {:ok, %Signature{}}
      iex> update_signature(signature, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_signature(%Signature{} = signature, attrs) do
    signature
    |> Signature.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a signature.
  ## Examples
      iex> delete_signature(signature)
      {:ok, %Signature{}}
      iex> delete_signature(signature)
      {:error, %Ecto.Changeset{}}
  """
  def delete_signature(%Signature{} = signature) do
    Repo.delete(signature)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking signature changes.
  ## Examples
      iex> change_signature(signature)
      %Ecto.Changeset{data: %Signature{}}
  """
  def change_signature(%Signature{} = signature, attrs \\ %{}) do
    Signature.changeset(signature, attrs)
  end
end
