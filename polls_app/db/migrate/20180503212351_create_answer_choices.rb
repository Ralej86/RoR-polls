class CreateAnswerChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.text :text, null:false
      t.integer :question_id, null:false
      t.integer :user_id, null:false
      
      t.timestamps
    end
    add_index :answer_choices, :question_id
    add_index :answer_choices, :user_id
  end
end
