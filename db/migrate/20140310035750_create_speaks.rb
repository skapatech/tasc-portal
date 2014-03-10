class CreateSpeaks < ActiveRecord::Migration
  def change
    create_table :speaks do |t|
      t.integer :provider_id
      t.integer :language_id

      t.timestamps
    end
  end
end
