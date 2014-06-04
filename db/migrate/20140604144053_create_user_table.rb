class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "arabic_name"
      t.string   "english_transliteration"
      t.string   "img"
      t.text     "etymology"
      t.text     "article"
      t.string   "triliteral_root"
      t.text     "dictionary_definition"
    end
  end
end
