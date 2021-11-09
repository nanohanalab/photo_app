class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :image
      t.timestamps
    end
    add_index :photos, [:user_id, :created_at]
  end
end
