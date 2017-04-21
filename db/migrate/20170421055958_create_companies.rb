class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :board, index: true, foreign_key: true
      t.references :employer, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
