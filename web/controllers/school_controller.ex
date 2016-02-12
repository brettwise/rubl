defmodule Rubl.SchoolController do
  use Rubl.Web, :controller
  alias Rubl.School

  def index(conn, _params) do
    schools = Repo.all(School)
    render conn, "index.html", schools: schools
  end

  def show(conn, %{"id" => id}) do
    school = Repo.get(School, id)
    render conn, "show.html", school: school
  end

  def new(conn, _params) do
    changeset = School.changeset(%School{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"school" => school_params}) do
    changeset = School.changeset(%School{}, school_params)
    case Repo.insert(changeset) do
      {:ok, school} ->
        conn
        |> put_flash(:info, "#{school.name} created!")
        |> redirect(to: school_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
