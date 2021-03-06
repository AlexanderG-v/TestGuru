# frozen_string_literal: true

class TestsUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tests_user, only: %i[show attempt update gist]

  def show; end

  def attempt; end

  def update
    @tests_user.accept!(params[:answer_ids])

    if @tests_user.completed?
      if @tests_user.rate?

        @tests_user.success_true
        badge_service = BadgeService.new(@tests_user).call
        flash[:notice] = t('.success') if badge_service.present?
      end

      TestsMailer.completed_test(@tests_user).deliver_now
      redirect_to attempt_tests_user_path(@tests_user)
    else
      render :show
    end
  end

  private

  def set_tests_user
    @tests_user = TestsUser.find(params[:id])
  end
end
