class AddPoliticalviewsToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :political_views, :string
  end
end
