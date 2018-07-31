# As a Visitor,
#   When I visit the genre index page,
#     I see all genres in the database.
#
# Testing requirements:
# - users should see at least 2 genres listed on the page

require 'rails_helper'

describe 'as a visitor' do
  describe 'visits genre index page' do
    it 'shows all genres' do
      genre_1 = Genre.create!(name: "rock")
      genre_2 = Genre.create!(name: "jazz")

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
  end
end
