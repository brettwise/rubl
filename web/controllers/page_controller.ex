defmodule Rubl.PageController do
  use Rubl.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
