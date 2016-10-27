require 'rails_helper'
RSpec.describe 'creating a post' do
  it 'creates a new channel and redirects to the channel' do
    user = create_user
    log_in user
    visit '/channels/new'
    fill_in 'Name', with: 'My channel'
    fill_in 'Description', with: 'My description'
    click_button 'Create Channel'
    expect(current_path).to eq("/channels/1")
    expect(page).to have_text('My channel')
    expect(page).to have_text('My description')
  end
end