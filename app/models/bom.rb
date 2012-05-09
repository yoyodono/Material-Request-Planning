class Bom < ActiveRecord::Base	
	has_many :details, :class_name => "BomDetail", :dependent => :destroy
	validates_associated :details	
	belongs_to :item 
	has_one :schedulling, :dependent => :destroy
	
  	after_update :save_details

  	def new_detail_attributes=(detail_attributes)
    	detail_attributes.each do |attributes|
      		details.build(attributes)
    	end
  	end
  
  	def existing_detail_attributes=(detail_attributes)
	    details.reject(&:new_record?).each do |detail|
    	  attributes = detail_attributes[detail.id.to_s]
      		if attributes
        		detail.attributes = attributes
      		else
        		details.delete(detail)
      		end
    	end
  	end
  
  	def save_details
    	details.each do |detail|
      		detail.save(false)
    	end
  	end
end
