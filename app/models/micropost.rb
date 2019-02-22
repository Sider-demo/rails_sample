# Micropost model sample
class Micropost < ApplicationRecord
  belongs_to :user

  # RuboCop will say "You can use `validates` instead of `validates_*`.".
  # For example:
  #   validates :content, presence: true, length: { maximum: 200 }
  validates :content, presence: true, length: { maximum: 200 }

  def convert_content(pattern, replaced)
    content.gsub(pattern, replaced)	
  end

  #
  # Class method
  #
  class << self
    def convert_content(pattern, replaced)
      Micropost.all.each do |m|
        m.update_attribute(:content, m.convert_content(pattern, replaced))
      end
    end
  end
end

