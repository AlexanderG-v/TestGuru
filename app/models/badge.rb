# frozen_string_literal: true

class Badge < ApplicationRecord

  enum badges_rules: {
    all_tests_by_category: 0,
    pass_test_by_level: 1,
    first_test_passed: 2
  }

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :image, :rule_name, :rule_value, presence: true
  validates :title, uniqueness: true
end
