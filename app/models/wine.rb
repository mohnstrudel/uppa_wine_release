class Wine < ApplicationRecord
  mount_uploader :logo, LogoUploader
  belongs_to :vintage, optional: true

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  after_save :set_slug

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :year,
      [:year, :id]
    ]
  end

  private

  def set_slug
    if self.year.present?
      begin
        slugged_one = self.vintage.title.downcase
        slugged_one = slugged_one.split(" ").join("-").delete(".").delete(",")
        slugged_two = self.vintage.subtitle.downcase
        slugged_two = slugged_two.split(" ").join("-").delete(".").delete(",")
        slugged_three = self.year
        self.slug = "#{slugged_one}-#{slugged_two}-#{slugged_three}"
      rescue NoMethodError => e
        self.slug = nil
      end
    else
      self.slug = self.id
    end
  end
end
