class SchedullingPeriod < ActiveRecord::Base
	has_many :details, :class_name => "PeriodDetail", :dependent => :destroy
end
