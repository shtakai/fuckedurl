# frozen_string_literal: true

require 'rails_helper'

describe RedirectController, type: :request do
  describe '#redirect' do
    let!(:link) { create(:link, url: 'https://yahoo.com') }

    it 'redirect to somewhere' do
      get redirect_url link.short_id
      expect(response).to redirect_to link.url
    end

    it 'can not redirect to somewhere' do
      get redirect_url 'ABCDE'
      expect(response).to redirect_to root_url
    end
  end
end
