class AddPresetToExperience < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :present, :boolean, default: false
  end
end
