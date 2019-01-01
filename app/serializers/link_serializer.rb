# frozen_string_literal: true

class LinkSerializer < ActiveModel::Serializer
  attributes :url, :short_id
end
