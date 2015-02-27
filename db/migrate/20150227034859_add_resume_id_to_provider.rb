class AddResumeIdToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :resume_id, :integer
  end
end
