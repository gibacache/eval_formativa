class Course < ActiveRecord::Base
  has_many :trees
  has_many :nodes, through: :trees
  has_many :questionable, through: :nodes, source_type: 'ArgumentativeQuestion'


  def to_label
    "#{self.number} - #{self.name}"
  end
end
