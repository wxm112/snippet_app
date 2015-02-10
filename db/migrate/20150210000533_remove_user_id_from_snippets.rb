class RemoveUserIdFromSnippets < ActiveRecord::Migration
  def change
    remove_column :snippets, :user_id, :integer
  end
end
