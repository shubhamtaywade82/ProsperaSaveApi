# frozen_string_literal: true

require 'swagger_helper'

describe 'Users Sessions API' do
  path '/sessions' do
    post 'Creates a user session' do
      tags 'Users Sessions'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }

      response '200', 'user session created' do
        schema type: :object,
               properties: {
                 token: { type: :string },
                 exp: { type: :string },
                 username: { type: :string }
               }
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end
  end

  path '/logout' do
    delete 'Destroys a user session' do
      tags 'Users Sessions'
      security [BearerAuth: []]

      response '204', 'user session destroyed' do
        run_test!
      end
    end
  end
end
