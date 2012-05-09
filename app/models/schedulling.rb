class Schedulling < ActiveRecord::Base
	
	belongs_to :bom
	has_many :periods, :class_name => "SchedullingPeriod", :dependent => :destroy
	validates_uniqueness_of :bom_id
	
	after_create :build_periods_bom
	after_update :save_details
	
	def build_periods_bom		
		@period_gr = SchedullingPeriod.new(:schedulling_id => self.id, :tipe_column => "GR", :bom_id => self.bom_id)
		@period_gr.save
		for i in (1..self.periode)
			@detail = PeriodDetail.new(:schedulling_period_id => @period_gr.id, :period => i)
			@detail.save
		end 
		@period_sr = SchedullingPeriod.new(:schedulling_id => self.id, :tipe_column => "SR", :bom_id => self.bom_id)
		@period_sr.save
		for i in (1..self.periode)
			@detail = PeriodDetail.new(:schedulling_period_id => @period_sr.id, :period => i)
			@detail.save
		end 
		build_period_entry
	end
	
	def build_period_entry		
		self.bom.details.each do |entry|
			@period_gr = SchedullingPeriod.new(:schedulling_id => self.id, :tipe_column => "GR", :entry_id => entry.id, :bom_id => entry.bom_id)
			@period_gr.save
			for i in (1..self.periode)
				@detail = PeriodDetail.new(:schedulling_period_id => @period_gr.id, :period => i)
				@detail.save
			end 
			@period_sr = SchedullingPeriod.new(:schedulling_id => self.id, :tipe_column => "SR", :entry_id => entry.id, :bom_id => entry.bom_id)
			@period_sr.save
			for i in (1..self.periode)
				@detail = PeriodDetail.new(:schedulling_period_id => @period_sr.id, :period => i)
				@detail.save
			end 		
		end
	end
	
	def i=(i)
		#BOM
		#BOM sing GR
		SchedullingPeriod.first(:conditions => {:tipe_column => "GR",:bom_id => self.bom.id}).details.each do |period_detail|
			quantity = i[period_detail.id.to_s][:quantity]		
        	@period_detail = PeriodDetail.first(:conditions => {:id => period_detail.id})
        	@period_detail.quantity = quantity
        	@period_detail.save(:validate => false)
		end		
		#BOM sing SR
		SchedullingPeriod.first(:conditions => {:tipe_column => "SR",:bom_id => self.bom.id}).details.each do |period_detail|
			quantity = i[period_detail.id.to_s][:quantity]		
        	@period_detail = PeriodDetail.first(:conditions => {:id => period_detail.id})
        	@period_detail.quantity = quantity
        	@period_detail.save(:validate => false)
		end				
		
		#Entry
		#Entry sing GR
		self.bom.details.each do |entry|
			SchedullingPeriod.first(:conditions => {:tipe_column => "GR", :bom_id => self.bom.id, :entry_id => entry.id}).details.each do |period_detail|
				quantity = i[period_detail.id.to_s][:quantity]		
	        	@period_detail = PeriodDetail.first(:conditions => {:id => period_detail.id})
	        	@period_detail.quantity = quantity
	        	@period_detail.save(:validate => false)
			end
		#Entry sing SR
			SchedullingPeriod.first(:conditions => {:tipe_column => "SR", :bom_id => self.bom.id, :entry_id => entry.id}).details.each do |period_detail|
				quantity = i[period_detail.id.to_s][:quantity]		
	        	@period_detail = PeriodDetail.first(:conditions => {:id => period_detail.id})
	        	@period_detail.quantity = quantity
	        	@period_detail.save(:validate => false)
			end			
		end
	end
	
  	def save_details
  		i=(i)
    	
  	end	
	
end
