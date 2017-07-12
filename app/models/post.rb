class Post < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 140}
  validates :body, presence: true

  scope :get_all, -> { order(created_at: :desc) }
end
