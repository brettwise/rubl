defmodule Rubl.Repo.Migrations.CreateSchool do
  use Ecto.Migration

  def change do
    create table(:schools) do

    add :name, :string
    add :state, :string
    add :city, :string
    add :active, :boolean, default: true
    add :number_of_students, :integer

    timestamps
    end
  end
end
