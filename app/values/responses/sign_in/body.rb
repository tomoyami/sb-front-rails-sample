module Responses
  module SignIn
    class Body
      include Virtus.value_object

      attribute :uid, String
      attribute :id, Integer
      attribute :email, String
      attribute :name, String
    end
  end
end
