require_relative '../../models/link.rb'
require './app/app.rb'
require 'database_cleaner'

Capybara.app = BookmarkManager

feature "tags" do
  scenario "creating a tag" do
    visit('links/new')
    fill_in('Title', with: 'ATP World Tour')
    fill_in('URL', with: 'www.atpworldtour.com')
    fill_in('tag', with: 'tennis')
    click_button('Save')
    link = Link.first
    expect(link.tags.map(&:name)).to include('tennis')
  end
end
