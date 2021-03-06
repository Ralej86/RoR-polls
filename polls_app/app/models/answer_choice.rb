# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :text             not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord
  validates :text, :question_id, :user_id, presence: true
  
  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'Question'
    
  belongs_to :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'User'
end
