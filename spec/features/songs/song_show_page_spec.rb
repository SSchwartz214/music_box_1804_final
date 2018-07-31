require 'rails_helper'

describe 'as a visitor' do
  describe 'visits song show page' do
    it 'shows rating of song' do
      artist = Artist.create(name: 'Journey')
      song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 5)
      song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)

      visit song_path(song_1)

      expect(page).to have_content(song_1.rating)
    end
  end

  it 'shows genres of this song' do
    artist = Artist.create(name: 'Journey')
    song = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808, rating: 5)
    genre_1 = song.genres.create!(name: "rock")
    genre_2 = song.genres.create!(name: "jazz")
    genre_3 = Genre.create!(name: "rap")

    visit song_path(song)

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to_not have_content(genre_3.name)
  end

end
