# frozen_string_literal: true

class TestsUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tests_user, only: %i[show attempt update gist]

  def show; end

  def attempt; end

  def gist
    result = GistQuestionService.new(@tests_user.current_question).call

    if result.success?
      Gist.create(gist_url: result.html_url, user: current_user, question: @tests_user.current_question)
      flash[:notice] = view_context.link_to(result.html_url, t('.success'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @tests_user
  end

  def update
    @tests_user.accept!(params[:answer_ids])

    if @tests_user.completed?
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
