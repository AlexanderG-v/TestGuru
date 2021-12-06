# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def send_feedback
    @feedback = params[:feedback]
    mail(to: Admin.all.map(&:email), subject: t('.subject', subject: @feedback.user.first_name))
  end
end
