class TestsUsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tests_user, only: %i[show attempt update]

  def show; end

  def attempt; end

  def update
    @tests_user.accept!(params[:answer_ids])

    if @tests_user.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
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
