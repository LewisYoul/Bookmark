
feature "Creating links" do
  scenario "uses form to submit new link" do
    visit('/links/new')
    fill_in('Title', with: 'ATP Tennis')
    fill_in('URL', with: 'http://www.atpworldtour.com/')
    click_button('Save')
    expect(page).to have_content('ATP Tennis')
    DatabaseCleaner.clean
  end
end
