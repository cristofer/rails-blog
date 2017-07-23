class Tag < ActiveRecord::Base
  scope :get_all, -> { order(:name) }
end
