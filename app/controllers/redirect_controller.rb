# frozen_string_literal: true

class RedirectController < ApplicationController
  def redirect
    link = Link.find_by short_id: params[:short_id]
    return redirect_to(root_path, alert: "not good fuck") unless link
    redirect_to link.url
  end
end
