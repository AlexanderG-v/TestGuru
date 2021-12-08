# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :image, :rule_name, :rule_value, presence: true
  validates :title, uniqueness: true
end
