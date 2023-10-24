# frozen_string_literal: true

module Users
  class SessionsController < ApplicationController
    before_action :authorize_request, except: :create

    def create
      @user = User.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.zone.now + 24.hours.to_i
        render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                       username: @user.username }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    def destroy; end

    private

    def login_params
      params.permit(:email, :password)
    end
  end
end
