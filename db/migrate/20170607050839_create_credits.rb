class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :employer, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.datetime :claimed_on

      t.timestamps
    end
  end
end
