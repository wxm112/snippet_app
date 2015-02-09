class AddContentToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :content, :text
  end
end
