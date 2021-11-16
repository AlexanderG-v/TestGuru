class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  
  validate :validate_answer_count, on: :create

  scope :correct_answer, -> { where(correct: true) }

  private

  def validate_answer_count
    errors.add(:answers_count, 'Должно быть от 1-го до 4-х ответов!') if question.answers.count >= 4
  end
end
