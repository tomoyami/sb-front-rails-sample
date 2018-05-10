class User
  include Virtus.model
  include ActiveModel::Model

  attribute :id, Integer
  attribute :email, String
  attribute :name, String
  attribute :password, String
  attribute :uid, String
  attribute :access_token, String
  attribute :client, String
  attribute :expiry, Integer

  def authorize_params
    { email: email, password: password }
  end

  def request_headers
    {
      'access-token' => access_token,
      'token-type' => 'Bearer',
      'uid' => uid,
      'client' => client,
      'Content-Type' => 'application/json'
    }
  end
end
