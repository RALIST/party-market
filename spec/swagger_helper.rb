require 'rails_helper'

def swagger_file(*relative_path)
  File.read(Rails.root.join(*relative_path))
end

def load_swagger_json(*relative_path)
  JSON.parse(swagger_file(*relative_path))
end

def load_definitions_json(*relative_path)
  json = JSON.parse(swagger_file(*relative_path))
  json.each do |k, v|
    model = JSON.parse(swagger_file(v['$ref']))
    json[k] = model
  end
end

def generate_token_for(user)
  payload = {
    iss: 'Shipstock Auth Server',
    iat: Time.current.utc.to_i,
    exp: Time.current.utc.to_i + 2 * 3600,
    jti: SecureRandom.uuid,
    user: {
      id: user.uuid,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    }
  }

  secret = ENV['JWT_SECRET'] || '123123'
  JWT.encode payload, secret, 'HS512'
end

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      swagger: '2.0',
      info: {
        title: 'Shipstock Connect API',
        version: '1.0',
        description: 'Shipstock API for UI render'
      },
      definitions: load_definitions_json('swagger/v1/definitions.json'),
      securityDefinitions: {
        Bearer: {
          description: 'jwt token from auth server',
          type: :apiKey,
          name: 'Authorization',
          in: :header
        }
      },
      basePath: '/api/v1'
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
  config.include Devise::Test::IntegrationHelpers
end
