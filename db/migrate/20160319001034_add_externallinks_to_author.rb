class AddExternallinksToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :email_link, :string
    add_column :authors, :facebook_link, :string
    add_column :authors, :linkedin_link, :string
    add_column :authors, :twitter_link, :string
    add_column :authors, :google_plus_link, :string
  end
end
