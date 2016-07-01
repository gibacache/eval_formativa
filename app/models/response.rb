class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :answerable, polymorphic: true
  belongs_to :node_id

end
