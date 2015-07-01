class CreatePoll < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :author_id, null: false
      t.string :title, null: false

      t.timestamps
    end

    add_index :polls, :author_id


  end
end
