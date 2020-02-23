class CreateFeaturedSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :featured_skills do |t|
      t.integer :service_id
      t.integer :tasker_id

      t.timestamps
    end
  end
end
