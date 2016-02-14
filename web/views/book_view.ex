defmodule Rubl.BookView do
  use Rubl.Web, :view
  alias Rubl.Book

  def get_title(%Book{title: title}) do
    title
  end
end
