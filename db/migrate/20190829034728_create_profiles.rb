class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :gender
      t.string :phone
      t.string :email
      t.text :address
      t.date :dob
      t.text :skill
      t.bigint :expected_salary, default: 0

      t.timestamps
    end
  end
end
