require 'rails_helper'

describe 'Root page', type: :system do
  it 'responds successfully' do
    visit root_path
    expect(page).to have_content 'TEST FUCKURL'
  end
end
