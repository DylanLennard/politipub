class AddAttachmentBannerToOntaps < ActiveRecord::Migration
  def self.up
    change_table :ontaps do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :ontaps, :banner
  end
end
