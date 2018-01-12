class Product < ActiveRecord::Base
 validates :title, :description, presence: true
 validate :title_is_shorter_than_description
 validates :price, presence: true, numericality: { greater_than: 0 }
 before_save :strip_html_from_description
 before_validation :title_lower_case
 belongs_to :category, optional: true
 extend Enumerize
  enumerize :level, in: [:hard,:normal,:easy]
  enumerize :country, in: ISO3166::Country.all_translated

 def title_lower_case
 	self.title = title.downcase
 	
 end

 def strip_html_from_description
 	self.description= ActionView::Base.full_sanitizer.sanitize(self.description)
end

 def title_is_shorter_than_description
 	return if title.blank? or description.blank?
 	if description.length < title.length
 		errors.add(:description, 'can not be shorter han title')
 	end
 end
 scope :active, -> {where(published: true)}
 scope :priced_more_than, -> (price) {where('price > ?', price)}


end
