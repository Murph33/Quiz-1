class AddDoneToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :done, :string
  end
end
