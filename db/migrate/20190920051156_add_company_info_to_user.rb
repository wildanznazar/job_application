class AddCompanyInfoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_info, :text
  end
end
