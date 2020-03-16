class Authentication

  def initialize(token)
    @token = token
  end

  def decode_token
    return unless @token

    secret = ENV['JWT_SECRET'] || '123123'
    JWT.decode(@token, secret, true, algorithm: 'HS512')
  end

  def user_from_token
    if @token.present?
      user_data = decode_token[0]['user'].symbolize_keys
      User.find_or_create_by!(id: user_data[:id]) do |u|
        u.first_name = user_data[:first_name] || 'Guest'
        u.last_name = user_data[:last_name] || 'User'
        u.email = user_data[:email]
      end
    else
      User.find_or_create_by!(email: 'admin@example.com') do |user|
        user.password = '123123123'
        user.access_tokens.create!(token: Doorkeeper::JWT.generate(user: user), refresh_token: SecureRandom.hex(10))
      end
    end
  end
end
