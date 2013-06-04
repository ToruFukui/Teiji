class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :name,default: '名無し'
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
