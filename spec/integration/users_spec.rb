# frozen_string_literal: true

require 'swagger_helper'

describe 'Users API' do
  path '/users' do
    get 'Retrieves a list of users' do
      tags 'Users'
      produces 'application/json'
      security [BearerAuth: []]

      response '200', 'list of users retrieved' do
        run_test!
      end
    end
  end

  path '/users/{_username}' do
    parameter name: :_username, in: :path, type: :string, description: 'Username of the user'
    get 'Retrieves a user by username' do
      tags 'Users'
      produces 'application/json'
      security [BearerAuth: []]

      response '200', 'user retrieved' do
        run_test!
      end

      response '404', 'user not found' do
        run_test!
      end
    end
  end
end