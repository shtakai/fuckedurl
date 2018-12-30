# frozen_string_literal: true

class LinksController < ApplicationController
  def index
    @link_count = Link.count
    # TODO magic number, pagination
    @links = Link.last(10)
    @new_link = Link.new
  end

  def create
    @generated_link = Link.new(link_params)
    respond_to do |format|
      if @generated_link.save
        flash[:notice] = 'URL has been fucked.'
      else
        flash[:caution] = "URL has not been fucked.: #{@generated_link.errors.details}"
      end
      format.html { redirect_to links_path }
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
