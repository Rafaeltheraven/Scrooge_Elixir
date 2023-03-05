defmodule Scrooge.Repo.Migrations.CreateGroupTables do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :owner, references(:users, on_delete: :delete_all), null: false
      add :title, :string, null: false
    end

    create table(:group_members) do
      add :activity, references(:groups, on_delete: :delete_all), null: false
      add :member, references(:users, on_delete: :delete_all), null: false
    end

    create table(:group_payments) do
      add :creditor, references(:group_members, on_delete: :delete_all), null: false
      add :amount, :integer, null: false
      add :desc, :string, null: false
      add :debitor, references(:group_members, on_delete: :delete_all)
      add :date, :date
    end
  end
end
