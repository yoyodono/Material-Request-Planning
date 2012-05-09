module BomsHelper
	def fields_for_detail(detail, &block)
	  prefix = detail.new_record? ? 'new' : 'existing'
	  fields_for("bom[#{prefix}_detail_attributes][]", detail, &block)
	end
	
	def add_detail_link(name) 
	  link_to_function name do |page| 
	    page.insert_html :bottom, :details, :partial => 'detail', :object => @bom.details.new 
	  end 
	end 
end
