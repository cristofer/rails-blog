class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 140 }
  validates :body, presence: true
  translates :title, :body
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable_on :tags

  scope :get_all_with_tags_translations, -> { includes(:tags, :translations).order(created_at: :desc) }
end
