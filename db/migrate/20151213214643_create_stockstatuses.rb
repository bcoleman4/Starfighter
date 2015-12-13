class CreateStockstatuses < ActiveRecord::Migration
  def change
    create_table :stockstatuses do |t|
      t.string :stuff

      t.timestamps null: false
    end
  end
end
