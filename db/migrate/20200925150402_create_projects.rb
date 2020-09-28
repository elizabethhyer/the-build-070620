class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :technique_used
      t.string :material_used
      t.integer :discipline_id

      t.timestamps
    end
  end
end
