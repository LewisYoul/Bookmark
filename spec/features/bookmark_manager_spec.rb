require './bookmark_manager.rb'

Capybara.app = BookmarkManager


feature 'index' do
  scenario 'There is a Link in the home page' do
    visit ('/')
    find_link('BBC').visible?
  end
end
