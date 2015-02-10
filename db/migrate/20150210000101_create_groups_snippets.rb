class CreateGroupsSnippets < ActiveRecord::Migration
  def change
    create_table :groups_snippets do |t|
      t.integer :group_id
      t.integer :snippet_id
    end
  end
end
