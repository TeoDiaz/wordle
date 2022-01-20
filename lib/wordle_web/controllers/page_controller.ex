defmodule WordleWeb.PageController do
  use WordleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
