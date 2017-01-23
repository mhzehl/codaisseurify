class Song < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true
  validates :release_year: true, length: {maximum: 4}
  validates :video_url, presence: true
end
