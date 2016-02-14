defmodule Rubl.Book do
  use Rubl.Web, :model

  schema "books" do
    field :title, :string
    field :author, :string
    field :pages, :integer
    field :publication, :integer

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(title author pages publication), [])
    |> validate_length(:title, min: 1, max: 400)
    |> validate_length(:author, min: 1, max: 200)
  end
end
