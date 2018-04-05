class AddMoviesTable < ActiveRecord::Migration[5.1]
  def self.up #creates table listings , use self when making a class method
    #creates the structure of the database
    create_table :movies do |t|
      t.string :title, null: false #translates into not flase in sql
      t.text :description
      t.integer :year
      t.float :rating
      t.integer :votes
      t.integer :runtime
      t.integer :revenue
      t.integer :metascore
  end
end

  def self.down #reverses the last migration so from verios 1.1.2 it would reverse back to 1.1.1
    drop_table :movies
  end
end
