class AddValidatedToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :validated, :boolean, :default => false
  end
end
