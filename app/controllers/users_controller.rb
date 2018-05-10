class UsersController < ApplicationController
  def sign_in
    unless request.post?
      @user = User.new
      return
    end

    begin
      @user = User.new(user_params)
      response = RestClient.post 'https://sb-api.tes.co.jp/api/v1/auth/sign_in', @user.authorize_params

      if response.code == 200
        header = Responses::SignIn::Header.new(response.headers)
        p JSON.parse(response.body)
        body = Responses::SignIn::Body.new(JSON.parse(response.body)['data'])

        session[:current_user] = User.new(
          name: body.name,
          email: body.email,
          id: body.id,
          access_token: header.access_token,
          client: header.client,
          uid: body.uid
        )
        redirect_to root_path
      end
    rescue RestClient::ExceptionWithResponse => e
      @response_body = JSON.parse(e.response.body)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
