class Photos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :post
      t.timestamps
    end
  end
end
