class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :cell
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.float :rate
      t.string :position
      t.string :organization
      t.integer :years_experience
      t.text :resume

      t.timestamps
    end
  end
end
