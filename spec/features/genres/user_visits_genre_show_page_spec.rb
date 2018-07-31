require 'rails_helper'

describe 'as a visitor' do
  describe 'visits genre show page' do
    it 'shows all songs belonging to that genre' do
      genre_1 = Genre.create!(name: "rock")
      genre_2 = Genre.create!(name: "jazz")
      artist = Artist.create(name: 'Journey')
      song_1 = genre_1.songs.create!(title: "Don't Stop Believing", length: 320, play_count: 390808, artist: artist)
      song_2 = genre_1.songs.create!(title: "Anyway You Want It", length: 420, play_count: 67908, artist: artist)
      song_3 = genre_2.songs.create!(title: "Cold Blooded", length: 453, play_count: 6343, artist: artist)

      visit genre_path(genre_1)

      expect(page).to have_content(song_1.title)
      expect(page).to have_content(song_2.title)
      expect(page).to_not have_content(song_3.title)
     end
  end

  it 'shows the average rating for all songs' do
    genre_1 = Genre.create!(name: "rock")
    genre_2 = Genre.create!(name: "jazz")
    artist = Artist.create(name: 'Journey')
    song_1 = genre_1.songs.create!(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 3, artist: artist)
    song_2 = genre_1.songs.create!(title: "Anyway You Want It", length: 420, play_count: 67908, rating: 4, artist: artist)
    song_3 = genre_2.songs.create!(title: "Cold Blooded", length: 453, play_count: 6343, artist: artist)

    visit genre_path(genre_1)

    expect(page).to have_content("Average rating: #{genre_1.average_song_rating}")
  end
end
