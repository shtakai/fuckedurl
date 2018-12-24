# frozen_string_literal: true

class LinksController < ApplicationController
  def index
    @link_count = Link.count
  end
end
