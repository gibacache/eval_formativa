class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :questionable, polymorphic: true
  belongs_to :answerable, polymorphic: true
  belongs_to :node, dependent: :destroy

end
