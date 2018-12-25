# frozen_string_literal: true

require 'rails_helper'

describe 'Links', type: :system, js: true do
  describe 'index' do
    before :each do
      2.times { create(:link, :valid_url) }
    end

    it 'displays "2" number of links' do
      visit links_path
      expect(page).to have_content 'there are 2 fucked up link(s).'
    end

    it 'shows 2 links' do
      visit links_path
      expect(page).to have_selector('.link>a.link_url', count: 2)
    end
  end

  # NOTE: VCR can't record system spec's transitions.
  # So that it must to write spec on request spec.
  # walkaround: use puffying-billy
  #
  # describe 'click link url' do
  #   it 'redirect to somewhere' do
  #   end
  # end
end
