class Vintage < ApplicationRecord
  has_many :wines, dependent: :destroy

  accepts_nested_attributes_for :wines, allow_destroy: true

  validates :title, presence: true

  after_save :set_slug

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :title,
      [:title, :subtitle]
    ]
  end

  def set_slug
    if self.slug.blank?
      begin
        slugged_one = self.title.downcase
        slugged_one = slugged_one.split(" ").join("-").delete(".").delete(",")
        slugged_two = self.subtitle.downcase
        slugged_two = slugged_two.split(" ").join("-").delete(".").delete(",")
        
        self.slug = "#{slugged_one}-#{slugged_two}"
      rescue NoMethodError => e
        self.slug = nil
      end
    end
  end

  def next_wine(wine)
    self.wines.where('id > ?', wine.id).try(:first).try(:slug)
  end

  def previous_wine(wine)
    self.wines.where('id < ?', wine.id).try(:first).try(:slug)
  end
end
