# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord
  validates :question_id, :user_id, presence: true
  
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
    
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'
  
  has_one :question,
    through: :answer_choice
    source: :question
    
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end
  
  def respondent_made_poll
    #Response -> AnswerChoice -> Question -> Poll (check resp_id(user_id))
    poll_author_id = self.question.poll.pluck(:author_id)
    #or
    #Poll.select(:author_id)
    #.joins(questions: :answer_choices)
    #.where(:author_id == user_id)
    #.pluck? can you use pluck after a select?
    
    if poll_author_id == self.user_id
      raise "cannot be poll author"
  end
end
