class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :board, index: true, foreign_key: true
      t.references :employer, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.string :job_title
      t.string :job_description
      t.string :job_location
      t.string :job_type
      t.string :job_url
      t.string :contact_email

      t.timestamps null: false
    end
  end
end
