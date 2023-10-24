# frozen_string_literal: true

module Users
  class RegistrationsController < ApplicationController
    before_action :authorize_request, except: :create

    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: { errors: user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(
        :username, :email, :password, :password_confirmation
      )
    end
  end
end
