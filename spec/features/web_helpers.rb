
def create_link(title, url, tag)
  visit('links/new')
  fill_in('Title', with: title)
  fill_in('URL', with: url)
  fill_in('tag', with: tag)
  click_button('Save')
end
