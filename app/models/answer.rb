class Answer < ActiveRecord::Base
  self.abstract_class = true
  has_many :responses, as: :answerable
end
