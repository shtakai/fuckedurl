# frozen_string_literal: true

require 'rails_helper'

describe 'Links', type: :system do
  describe 'index' do
    before :each do
      2.times { create(:link, :valid_url) }
    end

    it 'responds successfully' do
      visit links_path
      expect(page).to have_content 'there are 2 fucked up link(s).'
    end
  end
end
