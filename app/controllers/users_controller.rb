# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: user, status: :ok
  end

  delegate :destroy, to: :user

  private

  def user
    @user ||= User.find_by!(username: params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end
