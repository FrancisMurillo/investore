defmodule InvestoreAccounts.Guardian do
  @moduledoc nil

  use Guardian, otp_app: :investore_accounts

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    # resource = MyApp.get_resource_by_id(id)
    {:ok, nil}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
