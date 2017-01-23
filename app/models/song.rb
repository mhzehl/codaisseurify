class Song < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true, uniqueness: true
  validates :release_year, presence: true, length: {maximum: 4}
  validates :video_url, presence: true
end
