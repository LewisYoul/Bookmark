
feature 'links' do
  scenario 'Viewing links' do
    link = Link.create(url: 'http://www.bbc.co.uk', title: 'BBC')
    visit '/links'
    expect(page.status_code).to eq 200
    within '#links' do
      expect(page).to have_content('BBC')
    end
    DatabaseCleaner.clean
  end
end
