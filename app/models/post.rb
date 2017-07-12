class Post < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 140}
  validates :body, presence: true
  translates :title, :body

  scope :get_all, -> { order(created_at: :desc) }
end
