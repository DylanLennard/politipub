class AddAttachmentBannerImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :banner_image
    end
  end

  def self.down
    remove_attachment :articles, :banner_image
  end
end
