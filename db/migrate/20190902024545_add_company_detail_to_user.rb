class AddCompanyDetailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_name, :string
    add_column :users, :address, :text
    add_column :users, :website, :string
    add_column :users, :company_email, :string
    add_column :users, :phone, :string
  end
end
