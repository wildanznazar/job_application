class AddPeriodToJobAd < ActiveRecord::Migration[5.2]
  def change
    add_column :job_ads, :ad_period, :date
  end
end
