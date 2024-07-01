defmodule Helpdesk.Users.Profile do

  use Ash.Resource, domain: Helpdesk.Users, data_layer: Ash.DataLayer.Ets

  attributes do
    uuid_primary_key :id

    attribute :email, :string

    attribute :name, :string

    attribute :phone, :string
  end

  actions do
    defaults [:read, :destroy, update: :*]

    create :create do
      accept [:email, :name, :phone]
    end
  end
end
