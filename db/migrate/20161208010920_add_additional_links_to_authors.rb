class AddAdditionalLinksToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :tumblr_link, :string
    add_column :authors, :personal_link, :string
  end
end
