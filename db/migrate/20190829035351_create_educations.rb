class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.references :profile, foreign_key: true
      t.string :institute
      t.string :qualification
      t.string :field_of_study
      t.string :grade
      t.date :graduation_date
      t.text :description

      t.timestamps
    end
  end
end
