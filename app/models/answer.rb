class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct_answer, -> { where(correct: 1) }
end
