class CreateSubjectAreas < ActiveRecord::Migration
  def change
    create_table :subject_areas do |t|
      t.string :name
      t.boolean :is_technical

      t.timestamps
    end
  end
end
