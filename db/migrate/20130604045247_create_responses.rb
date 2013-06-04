class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name,default:'名無し'
      t.string :email
      t.text :content
      t.integer :article_id

      t.timestamps
    end
  end
end
