# Generated via
#  `rails generate curation_concerns:work Resource`
require 'rails_helper'
include Warden::Test::Helpers

feature 'Create a Resource' do
  context 'a logged in user' do
    let(:user_attributes) do
      { email: 'test@example.com' }
    end
    let(:user) do
      User.new(user_attributes) { |u| u.save(validate: false) }
    end

    before do
      login_as user
    end

    scenario do
      visit new_curation_concerns_resource_path
      fill_in 'Title', with: 'Test Resource'
      click_button 'Create Resource'
      expect(page).to have_content 'Test Resource'
    end
  end
end
