module Responses
  module SignIn
    class Header
      include Virtus.value_object

      attribute :access_token, String
      attribute :client, String
      attribute :expiry, Integer
    end
  end
end
