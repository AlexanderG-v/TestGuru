# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def new
    @feedback = @user.feedbacks.new
  end

  def create
    @feedback = @user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.with(feedback: @feedback).send_feedback.deliver_now
      redirect_to tests_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message)
  end

  def find_user
    @user = current_user
  end
end
