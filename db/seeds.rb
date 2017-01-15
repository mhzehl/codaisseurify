Song.delete_all
Artist.delete_all

# Songs -- A song belongs to an artist -- children
song1 = Song.create!( { name: “Uprising”, release_year: 2009, video_url: “https://www.youtube.com/watch?v=w8KQmps-Sog” } )
song2 = Song.create!( { name: “Madness”, release_year: 2012, video_url: ”https://www.youtube.com/watch?v=Ek0SgwWmF9w” } )
song3 = Song.create!( { name: “Creep”, release_year: 1993, video_url: ”https://www.youtube.com/watch?v=XFkzRNyygfk” } )
song4 = Song.create!( { name: “Karma Police”, release_year: 1997, video_url: ”https://www.youtube.com/watch?v=IBH97ma9YiI” } )
song5 = Song.create!( { name: “Sharp Dressed Man”, release_year: 1983, video_url: ”https://www.youtube.com/watch?v=7wRHBLwpASw” } )
song6 = Song.create!( { name: “La Grange”, release_year: 1973, video_url: ”https://www.youtube.com/watch?v=aB4nH8qx2IM” } )

# Artists -- An artist has many songs -- parent
artist1 = Artist.create!( { name: “Muse”, genre: “Progressive Rock”, band_members: 3, image_url: “http://bit.ly/2iv798V” } )
artist2 = Artist.create!( { name: “Radiohead”, genre: “Alternative Rock”, band_members: 5, image_url: “http://bit.ly/2irgy64” } )
artist3 = Artist.create!( { name: “ZZ Top”, genre: “Blues Rock”, band_members: 6, image_url: “http://bit.ly/2jyL8Yv” } )

artist1.songs << [song1, song2]
artist1.save

artist2.songs << [song3, song4]
artist2.save

artist3.songs << [song5, song6]
artist3.save
