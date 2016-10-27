require 'rails_helper'
RSpec.describe 'new channel' do
  it 'provides form in new channel page to create a new channel' do
    user = create_user
    log_in user
    visit '/channels/new'
    expect(page).to have_text('New Channel')
  end
end