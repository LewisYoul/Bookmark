feature "sign in" do
  scenario "user can sign in" do
    visit '/'
    fill_in('email', with: 'allan@music.com')
    fill_in('password', with: 'rockband')
    click_button('Enter')
    expect(page).to have_content('Welcome allan@music.com')
    expect(User.all.length).to eq(1)
  end
end
