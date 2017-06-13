class AddImagesToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :logo, :text
    add_column :companies, :image_data, :text
  end
end
