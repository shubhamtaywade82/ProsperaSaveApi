# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: user, status: :ok
  end

  delegate :destroy, to: :user

  def user
    @user ||= User.find_by!(username: params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end
