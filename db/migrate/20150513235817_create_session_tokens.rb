class CreateSessionTokens < ActiveRecord::Migration
  def change
    create_table :session_tokens do |t|
      t.integer :user_id, null: false, index: true
      t.string :token, null: false, index: true

      t.timestamps
    end
  end
end
