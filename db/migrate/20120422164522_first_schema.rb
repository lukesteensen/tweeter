class FirstSchema < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.boolean :protected
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.timestamps
    end

    create_table :posts do |t|
      t.integer :user_id
      t.string :body
      t.timestamps
    end

    create_table :followings do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.boolean :approved
      t.timestamps
    end

  end
end
