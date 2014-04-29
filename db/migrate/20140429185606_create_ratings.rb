class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :provider_id
      t.integer :rating
      t.string :comments

      t.timestamps
    end
  end
end
