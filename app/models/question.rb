class Question < ApplicationRecord
  validates :question, presence: true
  validates :response, presence: true
end
