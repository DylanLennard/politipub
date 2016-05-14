class ChangePublishedtoOntaps < ActiveRecord::Migration
  def change
  	change_column :ontaps, :published, :boolean, :default => false
  end
end
