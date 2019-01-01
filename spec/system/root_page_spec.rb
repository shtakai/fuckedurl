require 'rails_helper'

describe 'Root page', type: :system do
  it 'responds successfully' do
    visit root_path
    expect(page).to have_content 'Here I am being fucked short.'
  end
end
