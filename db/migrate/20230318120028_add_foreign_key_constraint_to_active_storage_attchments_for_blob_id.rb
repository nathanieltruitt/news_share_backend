# adds a foreign key to active storage attachments if blobs table exists and foreign key doesn't already exist
class AddForeignKeyConstraintToActiveStorageAttchmentsForBlobId < ActiveRecord::Migration[7.0]
  def up
    return if foreign_key_exists?(:active_storage_attachments, column: :blob_id)
    return unless table_exists?(:active_storage_blobs)

    add_foreign_key :active_storage_attachments, :active_storage_blobs, column: :blob_id
  end
end
