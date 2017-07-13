class Post < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 140}
  validates :body, presence: true
  translates :title, :body
  extend FriendlyId
  friendly_id :title, :use => :slugged

  scope :get_all, -> { order(created_at: :desc) }
end
