# frozen_string_literal: true

class Api::V1::LinksController < ApiController
  def index
    links = Link.last(10)
    render json: links
  end

  def show
    link = Link.find(params[:id])
    render json: link
  end

  def create
    link = Link.find_or_create_by(link_url_params)
    render json: link
  end

  private

  def link_url_params
    params.permit(:url)
  end
end

