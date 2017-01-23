require 'rails_helper'

RSpec.describe Song do

  describe "validations" do
    # it "is invalid without a name" do
    #   song = Song.new(name: "")
    #   song.valid?
    #   expect(song.errors).to have_key(:name)
    # end
    #
    # it "is invalid without a release year" do
    #   song = Song.new(release_year: "")
    #   song.valid?
    #   expect(song.errors).to have_key(:release_year)
    # end
    #
    # it "is invalid without a video url" do
    #   song = Song.new(video_url: "")
    #   song.valid?
    #   expect(song.errors).to have_key(:video_url)
    # end
    #
    # let(:song) {create(:song)}

    it "is not valid without a name" do
      artist = build(:artist)
      song1 = Song.create!(name: "Uprising", release_year: 2006, video_url: "https://www.youtube.com/watch?v=w8KQmps-Sog", artist)
      song1.name = nil
      song.valid?
      expect(song.errors).to have_key(:name)
    end
  end
end
