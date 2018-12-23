class Link < ApplicationRecord
  before_create :generate_short_id

  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :url, uniqueness: true

  private

  def generate_short_id
    self.short_id = Array.new(10) { Faker::Types.character }.join
  end
end
