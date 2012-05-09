class BomDetail < ActiveRecord::Base
	belongs_to :bom
  	belongs_to :item

end
