defmodule Rubl.School do
  use Rubl.Web, :model

  schema "schools" do
    field :name, :string
    field :state, :string
    field :city, :string
    field :active, :boolean, default: true
    field :number_of_students, :integer

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name state city number_of_students), [])
    |> validate_length(:name, min: 1, max: 100)
    |> validate_length(:state, is: 2)
    |> validate_length(:city, min: 1, max: 40)
    |> validate_number(:number_of_students, less_than: 40000)
  end
end
