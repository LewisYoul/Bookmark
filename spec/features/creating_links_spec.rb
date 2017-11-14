require_relative '../../models/link.rb'
require './app/app.rb'

Capybara.app = BookmarkManager

feature "Creating links" do
  scenario "uses form to submit new link" do
    visit('/links/new')
    fill_in('Title', with: 'ATP Tennis')
    fill_in('URL', with: 'http://www.atpworldtour.com/')
    click_button('Save')
  end
end
