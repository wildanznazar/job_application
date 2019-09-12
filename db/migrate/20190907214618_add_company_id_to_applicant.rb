class AddCompanyIdToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :company_id, :integer
  end
end
