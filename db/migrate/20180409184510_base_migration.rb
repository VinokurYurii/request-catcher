class BaseMigration < ActiveRecord::Migration[5.1]
  def up
    create_table :requests do |t|
      t.string :query_string, null: false, index: true
      t.string :method, null: false
      t.string :remote_ip
      t.text :scheme
      t.timestamp :created_at
    end

    create_table :request_params do |t|
      t.integer :request_id, null: false, :references => [:request, :id]
      t.string :key, null: false
      t.text :value
    end

    create_table :request_headers do |t|
      t.integer :request_id, null: false, :references => [:request, :id]
      t.string :key, null: false
      t.text :value
    end

    create_table :request_cookies do |t|
      t.integer :request_id, null: false, :references => [:request, :id]
      t.string :key, null: false
      t.text :value
    end
  end
  def down
    drop_table :request_cookies
    drop_table :request_headers
    drop_table :request_params
    drop_table :requests
  end
end
