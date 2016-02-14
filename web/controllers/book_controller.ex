defmodule Rubl.BookController do
  use Rubl.Web, :controller
  alias Rubl.Book

  def index(conn, _params) do
    books = Repo.all(Book)
    render conn, "index.html", books: books
  end

  def show(conn, %{"id" => id}) do
    book = Repo.get(Book, id)
    render conn, "show.html", book: book
  end

  def new(conn, _params) do
    changeset = Book.changeset(%Book{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"book" => book_params}) do
    changeset = Book.changeset(%Book{}, book_params)
    case Repo.insert(changeset) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Record for #{book.title} created!")
        |> redirect(to: book_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
