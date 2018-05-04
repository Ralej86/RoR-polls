class RemovedUserId2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :answer_choices :user_id
  end
end
