class Link < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  # validates :url, :url => true
  # validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
end
