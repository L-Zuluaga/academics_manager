defmodule AcademicsManagersWeb.SignatureController do
  use AcademicsManagersWeb, :controller

  alias AcademicsManagers.School
  alias AcademicsManagers.School.Signature

  def index(conn, _params) do
    signatures = School.list_signatures()
    render(conn, "index.html", signatures: signatures)
  end

  def new(conn, _params) do
    changeset = School.change_signature(%Signature{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"signature" => signature_params}) do
    case School.create_signature(signature_params) do
      {:ok, signature} ->
        conn
        |> put_flash(:info, "Signature created successfully.")
        |> redirect(to: Routes.signature_path(conn, :show, signature))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    signature = School.get_signature!(id)
    render(conn, "show.html", signature: signature)
  end

  def edit(conn, %{"id" => id}) do
    signature = School.get_signature!(id)
    changeset = School.change_signature(signature)
    render(conn, "edit.html", signature: signature, changeset: changeset)
  end

  def update(conn, %{"id" => id, "signature" => signature_params}) do
    signature = School.get_signature!(id)

    case School.update_signature(signature, signature_params) do
      {:ok, signature} ->
        conn
        |> put_flash(:info, "Signature updated successfully.")
        |> redirect(to: Routes.signature_path(conn, :show, signature))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", signature: signature, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    signature = School.get_signature!(id)
    {:ok, _signature} = School.delete_signature(signature)

    conn
    |> put_flash(:info, "Signature deleted successfully.")
    |> redirect(to: Routes.signature_path(conn, :index))
  end
end
