defmodule Rubl.PageControllerTest do
  use Rubl.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Rubl.io!"
  end
end
