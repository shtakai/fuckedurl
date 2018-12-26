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
        format.html { redirect_to links_path, notice: 'URL has been fucked.' }
      else
        format.html { render :index }
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
