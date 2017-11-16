require_relative '../../models/link.rb'
require './app/app.rb'
require 'database_cleaner'

Capybara.app = BookmarkManager
DatabaseCleaner.strategy = :truncation

feature "tags" do
  scenario "creating a tag" do
    create_link('ATP Tennis', 'http://www.atpworldtour.com', 'tennis')
    link = Link.last
    expect(link.tags[0].name).to eq('tennis')
    DatabaseCleaner.clean
  end
  scenario "filter by tag" do
    create_link('ATP Tennis', 'http://www.atpworldtour.com', 'tennis')
    create_link('Tennis.com', 'http://www.tennis.com', 'tennis')
    create_link('BBC', 'http://www.bbc.co.uk', 'news')
    visit '/tags/tennis'
    expect(page).to have_content('ATP Tennis')
    expect(page).to have_content('Tennis.com')
    expect(page).not_to have_content('BBC')
  end
end
