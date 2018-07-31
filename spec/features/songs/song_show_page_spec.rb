# As a Visitor,
#   When I visit a song show page,
#     I see the numeric rating for this song
#
# Testing requirements:
# - rating should be an integer attribute (from 1 to 5)
require 'rails_helper'

describe 'as a visitor' do
  describe 'visits song show page' do
    it 'shows rating of song' do
      artist = Artist.create(name: 'Journey')
      song_1 = artist.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808)
      song_2 = artist.songs.create(title: "Anyway You Want It", length: 420, play_count: 67908)

      visit song_path(song_1)

      expect(page).to have_content(song_1.rating)
    end
  end
end
