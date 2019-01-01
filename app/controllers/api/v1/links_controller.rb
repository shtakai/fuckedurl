# frozen_string_literal: true

class Api::V1::LinksController < ApiController
  include Concerns::ApiResponse

  def index
    links = Link.last(10)
    response_success_with_resource links
  end

  def show
    link = Link.find(params[:id])
    if link
      response_success_with_resource link
    else
      response_not_found
    end
  end

  def create
    link = Link.find_or_initialize_by(link_url_params)
    if link.save
      response_success_with_resource link
    else
      response_bad_request
    end
  end

  private

  def link_url_params
    params.permit(:url)
  end
end

