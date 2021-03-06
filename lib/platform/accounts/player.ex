defmodule Platform.Accounts.Player do
  use Ecto.Schema
  import Ecto.Changeset


  schema "players" do
  	field :display_name, :string
  	field :password, :string, virtual: true
  	field :password_digest, :string
    field :score, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:display_name, :password, :score, :username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
