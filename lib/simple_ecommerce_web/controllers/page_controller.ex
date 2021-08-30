defmodule SimpleEcommerceWeb.PageController do
  use SimpleEcommerceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
