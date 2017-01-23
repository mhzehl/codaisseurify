class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true, length: {maximum: 25}
  validates :band_members, presence: true
  validates :image_url, presence: true
end
