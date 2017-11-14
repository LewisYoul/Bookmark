require_relative '../../models/link.rb'
require './app/app.rb'


Capybara.app = BookmarkManager


feature 'links' do
  scenario 'Viewing links' do
    Link.create(url: 'http://www.bbc.co.uk', title: 'BBC')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
