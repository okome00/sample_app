class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      
      # テーブルのカラムを定義
      t.string :title
      t.string :body
    end
  end
end
