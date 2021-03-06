defmodule ChatExample.User do
  use ChatExample.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string

    timestamps
  end

  @required_fields ~w(name email)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 2)
    |> validate_length(:name, max: 25)
    |> validate_format(:email, ~r/@/)
  end

  def ignoring? do
    false
  end
end
