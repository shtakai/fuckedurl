# frozen_string_literal: true

class LinksController < ApplicationController
  def index
    @link_count = Link.count
    # TODO magic number, pagination
    @links = Link.last(10)
    @new_link = Link.new
  end
  end
end
