class Link < ApplicationRecord
  ID_LENGTH = 10
  LETTER = %W(
    a b c d e f g h j k m n p q r s t u v w x y z 0 1 2 3 4 5 6 7 8
  ).map(&:downcase).compact.freeze

  before_create :generate_short_id
  before_save :inclement_generated

  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :url, uniqueness: true

  before_validation :ensure_unique, on: :create

  private

  def generate_short_id
    self.short_id = Array.new(ID_LENGTH) { LETTER.sample }.join
  end

  def inclement_generated
    self.generated += 1
  end

  def ensure_unique
    begin
      self.short_id = generate_short_id
    end while self.class.exists?(short_id: self.short_id)
  end
end
