# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :tests_users, dependent: :nullify, foreign_key: 'current_question_id'

  validates :body, presence: true
end
