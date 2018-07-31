require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end

  # describe 'relationships' do
  #   it{should belong_to(:artist)}
  # end
end
