require 'rails_helper'

describe "User visits categories index page" do
  context 'as admin' do
    it 'allows admin to see all categories' do
      admin = User.create(username: "Dee", password: 'password', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content('Admin Categories')
    end
  end

  context 'as a default user' do
    it 'does not allow default user to see admin categories index' do
      user = User.create(username: 'Ian', password: 'test123')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content('Admin Categories')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
   it 'clicks create and sees new genre on index page' do
      admin = User.create(username: "Dee", password: 'password', role: 1)
      genre_1 = Genre.create!(name: "rock")
      genre_2 = Genre.create!(name: "jazz")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      fill_in :genre_name, with: "classical"

      click_on "Create new genre"

      expect(current_path).to eq(genres_path)
      expect(page).to have_content("classical")
    end
   it 'clicks create and does not submit successfully' do
      admin = User.create(username: "Dee", password: 'password', role: 1)
      genre_1 = Genre.create!(name: "rock")
      genre_2 = Genre.create!(name: "jazz")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      click_on "Create new genre"

      expect(current_path).to eq(genres_path)
      expect(page).to_not have_content("classical")
    end
end
