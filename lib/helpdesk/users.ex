defmodule Helpdesk.Users do
  use Ash.Domain

  resources do
    resource Helpdesk.Users.Profile
  end
end
