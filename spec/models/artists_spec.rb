require 'rails_helper'

RSpec.describe Artist do
  describe "validations" do
    it "is invalid without a name" do
      artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "is invalid without a genre longer than 20 characters" do
      artist = Artist.new(genre: "This is a genre with more than 20 characters long. That's for sure!")
      artist.valid?
      expect(artist.errors).to have_key(:genre)
    end

    it "is invalid without band members" do
      artist = Artist.new(band_members: "")
      artist.valid?
      expect(artist.errors).to have_key(:band_members)
    end

    it "is invalid without an image url" do
      artist = Artist.new(image_url: "")
      artist.valid?
      expect(artist.errors).to have_key(:image_url)
    end

    describe "#order_by_name" do
      let!(:artist1) { create :artist, name: "Radiohead" }
      let!(:artist2) { create :artist, name: "Muse" }
      let!(:artist3) { create :artist, name: "ZZ-top" }

      it "returns a sorted array of artists by name" do
        expect(Room.order_by_name).to match_array [artist2, artist1, artist3]
      end
    end
  end
end
