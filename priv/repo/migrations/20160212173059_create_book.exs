defmodule Rubl.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :author, :string, null: false
      add :pages, :integer, null: false
      add :publication, :integer, null: false

      timestamps
    end
  end
end
