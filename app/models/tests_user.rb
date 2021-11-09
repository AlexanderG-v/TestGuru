class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.result += 1
    end

    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count

    (correct_answer_count == correct_answer.where(id: answer_ids).count) && 
    correct_answer_count == answer_ids.count
  end

  def correct_answer
    current_question.answers.correct_answer
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
