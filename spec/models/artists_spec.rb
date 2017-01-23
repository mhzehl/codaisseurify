require 'rails_helper'

RSpec.describe Artist do

  # Make sure factory works
  it "has a valid factory" do
    expect(build(:artist)).to be_valid
  end

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

    it "is invalid with a non-unique name" do
      artist1 = Artist.create(name: "Radiohead", genre: "Progressive Rock", band_members: 3, image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1485084782/muse2_knapdb.jpg")
      artist2 = Artist.create(name: "Radiohead", genre: "Progressive Rock", band_members: 3, image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1485084782/muse2_knapdb.jpg")
      artist1.valid?
      artist2.valid?
      expect(artist1.errors).not_to have_key(:name)
      expect(artist2.errors).to have_key(:name)
    end
  end

    describe "the association with Song" do
      let!(:artist1) { create(:artist) }
      let!(:artist2) { create(:artist, name: "ZZ-top", genre: "Blues Rock", band_members: 6, image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1485084835/zz-top_k0kock.jpg") }
      let!(:song1) { create(:song) }
      let!(:song2) { create(:song, name: "La Grange", release_year: 1973, video_url: "https://www.youtube.com/watch?v=aB4nH8qx2IM", artist: artist2) }
      let!(:song3) { create(:song, name: "Sharp Dressed Man", release_year: 1983, video_url: "https://www.youtube.com/watch?v=aB4nH8qx2IM", artist: artist2) }

    it "can have multiple songs" do
      expect(artist2.songs.length).to eq(2)
      expect(artist2.songs.first).to eq(song2)
    end

    it "can access the properties of a song" do
      expect(artist2.songs.last.name).to eq("Sharp Dressed Man")
    end

    it "cannot access other artists songs" do
      expect(artist1.songs).not_to include(song2)
    end

    it "destroys all songs when artist is deleted" do
      expect { artist2.destroy }.to change(Song, :count).by(-2)
    end
  end
end
