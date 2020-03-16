require 'rails_helper'

describe Api::V1::RegistrationsController, type: :controller, devise: true do

  describe '#POST sign_up_path' do
    it 'creates user' do
      post :create, params: { user: { email: 'admin@example.com', password: '123123123' } }
      data = JSON.parse(response.body).symbolize_keys
      puts data
      expect(response.status).to eq 201
      expect(data[:user]).not_to be_nil
    end
  end
end
