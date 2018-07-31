require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it{should have_many(:genre_songs)}
    it{should have_many(:songs).through(:genre_songs)}
  end

  describe 'instance methods' do
    it '#average_song_rating' do
      genre = Genre.create!(name: "rock")
      artist = Artist.create(name: 'Journey')
      song_1 = genre.songs.create!(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 3, artist: artist)
      song_2 = genre.songs.create!(title: "Anyway You Want It", length: 420, play_count: 67908, rating: 5, artist: artist)

      expect(genre.average_song_rating).to eq(4)
    end
  end
end
