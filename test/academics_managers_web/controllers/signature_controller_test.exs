defmodule AcademicsManagersWeb.SignatureControllerTest do
  use AcademicsManagersWeb.ConnCase

  import AcademicsManagers.SchoolFixtures

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  describe "index" do
    test "lists all signatures", %{conn: conn} do
      conn = get(conn, Routes.signature_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Signatures"
    end
  end

  describe "new signature" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.signature_path(conn, :new))
      assert html_response(conn, 200) =~ "New Signature"
    end
  end

  describe "create signature" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.signature_path(conn, :create), signature: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.signature_path(conn, :show, id)

      conn = get(conn, Routes.signature_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Signature"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.signature_path(conn, :create), signature: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Signature"
    end
  end

  describe "edit signature" do
    setup [:create_signature]

    test "renders form for editing chosen signature", %{conn: conn, signature: signature} do
      conn = get(conn, Routes.signature_path(conn, :edit, signature))
      assert html_response(conn, 200) =~ "Edit Signature"
    end
  end

  describe "update signature" do
    setup [:create_signature]

    test "redirects when data is valid", %{conn: conn, signature: signature} do
      conn = put(conn, Routes.signature_path(conn, :update, signature), signature: @update_attrs)
      assert redirected_to(conn) == Routes.signature_path(conn, :show, signature)

      conn = get(conn, Routes.signature_path(conn, :show, signature))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, signature: signature} do
      conn = put(conn, Routes.signature_path(conn, :update, signature), signature: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Signature"
    end
  end

  describe "delete signature" do
    setup [:create_signature]

    test "deletes chosen signature", %{conn: conn, signature: signature} do
      conn = delete(conn, Routes.signature_path(conn, :delete, signature))
      assert redirected_to(conn) == Routes.signature_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.signature_path(conn, :show, signature))
      end
    end
  end

  defp create_signature(_) do
    signature = signature_fixture()
    %{signature: signature}
  end
end
