defmodule GpxPhoenixWeb.PageController do
  use GpxPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
