defmodule Helpdesk.Support.Ticket do
  @moduledoc """
  resource
  """

  use Ash.Resource, domain: Helpdesk.Support, data_layer: Ash.DataLayer.Ets

  attributes do
    uuid_primary_key :id
    attribute :subject, :string do
      allow_nil? false
      public? true
    end

    attribute :status, :atom do
      constraints [one_of: [:open, :closed]]
      default :open
      allow_nil? false
    end
  end


  actions do
    defaults [:read]

    create :open_ticket do
      accept [:subject]
    end

    update :close_ticket do
      accept []

      validate attribute_does_not_equal(:status, :closed) do
        message "Ticket is already closed"
      end

      change set_attribute(:status, :closed)
    end
  end
end
