class Garden < ApplicationRecord
  has_many :plots

  def less_than_100
    self.plots.joins(:plants).select('plants.*').where('days_to_harvest < 100').distinct
  end
end
