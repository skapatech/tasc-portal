class CreateExpertises < ActiveRecord::Migration
  def change
    create_table :expertises do |t|
      t.integer :subject_id
      t.integer :provider_id
      t.integer :experience
      t.string :comment

      t.timestamps
    end
  end
end
