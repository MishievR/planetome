class AddLinkToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :link, :string
    add_column :ideas, :news_description, :text    
  end
end
