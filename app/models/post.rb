class Post < ActiveRecord::Base

  scope :get_all, -> { order(:created_at) }
end
