module JWTTokenResponse

  def body
    {
      token: @token.plaintext_token,
      refresh_token: @token.plaintext_refresh_token
    }
  end
end
