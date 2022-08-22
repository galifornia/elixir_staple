defmodule ElixirStapleWeb.PageController do
  use ElixirStapleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
