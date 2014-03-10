class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :provider_id
      t.integer :degree_id
      t.string :major

      t.timestamps
    end
  end
end
