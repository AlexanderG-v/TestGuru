# frozen_string_literal: true

class TestsUser < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  scope :success, -> { where(success: true) }

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def success_rate
    (100 / test.questions.count * result.to_f).round
  end

  def rate?
    success_rate >= SUCCESS_RATIO
  end

  def completed?
    current_question.nil? || time_is_up?
  end

  def time_is_up?
    test.timer.present? && time_left.negative?
  end
  
  def time_left
    created_at - Time.now + test.timer * 60
  end

  def accept!(answer_ids)
    self.result += 1 if correct_answer?(answer_ids)

    save!
  end

  def total_questions
    test.questions.count
  end

  def success_true
    update!(success: true)
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil?
      test.questions.order(:id).first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answer.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answer
    current_question.answers.correct_answer
  end
end
