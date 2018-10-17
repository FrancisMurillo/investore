defmodule InvestoreAccounts.TestFactory do
  @moduledoc nil

  use ExMachina.Ecto, repo: InvestoreAccounts.Repo

  alias Faker

  alias InvestoreAccounts.User

  def user_factory,
    do: %User{
      uuid: Faker.UUID.v4(),
      username: Faker.Internet.user_name(),
      email: Faker.Internet.email(),
      image_url: Faker.Internet.image_url(),
      role: RoleEnum.__enum_map__() |> Enum.map(&elem(&1, 1)) |> Faker.Util.pick()
    }

  def guest_user_factory,
    do: build(:user, %{role: :guest})
end
