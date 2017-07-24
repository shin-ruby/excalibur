class AddQiniuHashToUploads < ActiveRecord::Migration[5.1]
  def change
    add_column :uploads, :qiniu_hash, :string
  end
end
