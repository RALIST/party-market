require 'rails_helper'

describe Doorkeeper::TokensController, type: :controller do

  let(:password) { '123123123' }
  let(:user) { create :user, password: password, email: 'admin@example.com' }

  before do
    post :create, params: { use_route: 'api/v1/', grant_type: 'password', email: user.email, password: password }
    data = JSON.parse(response.body).symbolize_keys
    @token = data[:token]
    @refresh_token = data[:refresh_token]
  end

  it 'generate token for user' do
    post :create, params: { use_route: 'api/v1/',grant_type: 'password', email: user.email, password: password }
    expect(response.status).to eq 200
    expect(response.body['token']).not_to be_nil
    expect(response.body['refresh_token']).not_to be_nil
  end

  it 'revokes token for user' do
    post :revoke, params: { use_route: 'api/v1/', token: @token }
    expect(response.status).to eq 200
  end

  it 'revokes refresh token for user' do
    post :revoke, params: { use_route: 'api/v1/', token: @refresh_token }
    expect(response.status).to eq 200
  end

end
