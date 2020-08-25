class CreateWhatIsIncludeds < ActiveRecord::Migration[5.2]
  def change
    create_table :what_is_includeds do |t|
      t.integer :service_id
      t.string :text

      t.timestamps
    end
  end
end
