class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :applicants do |t|
      t.references :job_ad, foreign_key: true
      t.references :user, foreign_key: true
      t.text :applicaiton

      t.timestamps
    end
  end
end
