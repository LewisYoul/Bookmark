
feature "navigation" do
  scenario "go to new link page" do
    visit('/links')
    click_button('New Bookmark')
    expect(page.current_path).to eq('/links/new')
  end
  scenario "go to new link page" do
    visit('/links/new')
    click_button('Bookmarks')
    expect(page.current_path).to eq('/links')
  end
end
