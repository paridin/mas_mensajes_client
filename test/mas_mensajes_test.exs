defmodule MasMensajesTest do
  @moduledoc """
  Public API list
  """
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias MasMensajes
  # doctest MasMensajes
  describe "profile" do
    test "Check profile" do
      use_cassette "account_profile" do
        assert {:ok,
                %{
                  cellphone: "5523909132",
                  company: "YourCompany",
                  credit: 197.06,
                  email: "onion@yourcompany.com",
                  message: "Completado Correctamente",
                  name: "ONION",
                  surname: "ALLIUM"
                }} = MasMensajes.profile()
      end
    end
  end

  describe "Campaign" do
    test "Send a campaign" do
      use_cassette "campaing_threshold" do
        campaign_name = "Threshold"
        message = "Hola <+B+>, Te quedan <+C+> de tu plan. Actualmente haz consumido <+D+>."

        recipients = [
          %{
            cellphone: "2525553812",
            name: "Paridin",
            field1: "10GB",
            field2: "90GB"
          }
        ]

        expected_output = %{
          message: "Completado Correctamente",
          campaign: 8_586_382,
          campaign_name: "Threshold",
          route: "Premium 3 Masiva",
          country: "Mexico",
          scheduled_date: nil,
          recipients_count: 1,
          encode: false,
          long_message: false,
          balance: 774.4
        }

        assert {ok, ^expected_output} =
                 MasMensajes.publish_sms_campaing(campaign_name, message, recipients)
      end
    end
  end
end
