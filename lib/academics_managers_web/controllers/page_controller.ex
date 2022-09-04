defmodule AcademicsManagersWeb.PageController do
  use AcademicsManagersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
