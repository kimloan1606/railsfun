class Product < ActiveRecord::Base
 validates :title, :description, presence: true
 validate :title_is_shorter_than_description
 validates :price, presence: true, numericality: { greater_than: 0 }

 def title_is_shorter_than_description
 	return if title.blank? or description.blank?
 	if description.length < title.length
 		errors.add(:description, 'can not be shorter han title')
 	end
 end
 scope :active, -> {where(published: true)}
 scope :priced_more_than, -> (price) {where('price > ?', price)}

end
