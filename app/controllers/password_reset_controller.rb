# frozen_string_literal: true

class PasswordResetController < ApplicationController
  def new

  end

  def create
    @user = User.find_by email: params[:email]
    PasswordMailer.with(user: @user).reset.deliver_later if @user.present?
    redirect_to root_path, notice: "If an account was found, you should have an email."
  end
end
