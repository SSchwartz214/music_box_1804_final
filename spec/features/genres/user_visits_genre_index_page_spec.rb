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

  it 'cant see form to create new genre' do
    genre_1 = Genre.create!(name: "rock")
    genre_2 = Genre.create!(name: "jazz")

    visit genres_path

    expect(page).to_not have_content("Create new Genre")
  end
end
