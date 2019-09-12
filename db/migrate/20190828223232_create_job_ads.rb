class CreateJobAds < ActiveRecord::Migration[5.2]
  def change
    create_table :job_ads do |t|
      t.references :user, foreign_key: true
      t.string :position_title
      t.string :position_level
      t.string :employment_type
      t.string :job_specialization
      t.string :work_location
      t.bigint :monthly_salary, default: 0
      t.string :education_level
      t.string :field_of_studies
      t.string :years_of_experience
      t.string :skills
      t.string :language
      t.text :job_description

      t.timestamps
    end
  end
end
