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

    it 'has input form for shortening url' do
      visit links_path
      expect(page).to have_content 'Here I am being fucked short.'
      expect(page).to have_selector('input.url')
    end

    it 'shows 2 links' do
      visit links_path
      expect(page).to have_selector('.link>a.link_url', count: 2)
    end
  end

  describe 'create short id from url' do
    context 'valid url' do
      it 'can create short id' do
        visit links_path
        fill_in 'fucked up your url', with: 'https://www.yahoo.com'
        click_button 'Create Link'
        expect(page).to have_content 'URL has been fucked.'
      end
    end

    context 'invalid url' do
      it 'can not create short id' do
        visit links_path
        fill_in 'fucked up your url', with: 'www.yahoo.com'
        click_button 'Create Link'
        expect(page).to have_content 'URL has not been fucked.'
        expect(page).to have_content ':invalid'
      end
    end

    context 'dup url' do
      it 'can not create short id' do
        link = create(:link, :valid_url)
        visit links_path
        fill_in 'fucked up your url', with: link.url
        click_button 'Create Link'
        expect(page).to have_content 'URL has been fucked.'
      end
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
