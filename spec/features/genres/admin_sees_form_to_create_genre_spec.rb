# As an admin user,
#   When I visit the same genre index page that visitors see,
#   I see the same information visitors see,
#     And I also see a form to create a new genre.
#
# Testing requirements:
# - users should see at least 2 genres listed on the page

require 'rails_helper'

describe "Admin visits genres index page" do
  context 'as admin' do
    it 'allows admin to see see form to create genre' do
      admin = User.create(username: "Dee", password: 'password', role: 1)
      genre_1 = Genre.create!(name: "rock")
      genre_2 = Genre.create!(name: "jazz")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      expect(page).to have_button('Create new genre')
    end
  end
end
