defmodule Rubl.UserView do
  use Rubl.Web, :view
  alias Rubl.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
