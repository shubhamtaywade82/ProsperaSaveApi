require 'swagger_helper'

describe 'Users Registrations API' do
  path '/registrations' do
    post 'create a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: %w[username email password password_confirmation]
      }

      response(201, 'user created') do
        let(:user) do
          { username: 'example', email: 'example@example.com', password: 'password', password_confirmation: 'password' }
        end

        run_test!
      end
    end
  end
end
