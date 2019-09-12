class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :profile, foreign_key: true
      t.string :position_title
      t.string :company_name
      t.date :join_start
      t.date :join_end
      t.string :role
      t.string :industry
      t.bigint :monthly_aslary, default: 0
      t.text :description

      t.timestamps
    end
  end
end
