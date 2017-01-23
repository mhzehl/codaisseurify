FactoryGirl.define do
  factory :song do
    name "Uprising"
    release_year 2006
    video_url "https://www.youtube.com/watch?v=w8KQmps-Sog"
    artist {build(:artist)}
  end
end
