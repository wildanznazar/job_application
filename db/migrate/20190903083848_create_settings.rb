class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :web_name
      t.text :address
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
