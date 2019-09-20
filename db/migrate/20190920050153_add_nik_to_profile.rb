class AddNikToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :nik, :string
  end
end
