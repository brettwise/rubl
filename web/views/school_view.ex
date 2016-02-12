defmodule Rubl.SchoolView do
  use Rubl.Web, :view
  alias Rubl.School

  def school_name(%School{name: name}) do
    name
  end

  def number_of_students(%School{number_of_students: number_of_students}) do
    number_of_students  
  end

end
