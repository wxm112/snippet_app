class CreateSnippetsUsers < ActiveRecord::Migration
  def change
    create_table :snippets_users do |t|
      t.integer :snippet_id
      t.integer :user_id
    end
  end
end
