class AddDescriptionToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :description, :text
  end
end
