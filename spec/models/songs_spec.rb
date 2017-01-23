require 'rails_helper'

RSpec.describe Song do

  # Make sure factory works
  it "has a valid factory" do
    expect(build(:song)).to be_valid
  end

  describe "validations" do
    it "is invalid without a name" do
      song = Song.new(name: "")
      song.valid?
      expect(song.errors).to have_key(:name)
    end

    it "is invalid without a release year" do
      song = Song.new(release_year: "")
      song.valid?
      expect(song.errors).to have_key(:release_year)
    end

    it "is invalid without a video url" do
      song = Song.new(video_url: "")
      song.valid?
      expect(song.errors).to have_key(:video_url)
    end
  end

  # Association between Song and Artist
  describe "the association with Song" do
    let!(:song) { build(:song) }

    it "is not valid without an artist" do
      song.artist = nil
      song.valid?
      expect(song.errors).to have_key(:artist)
    end
  end
end
