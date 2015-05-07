# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  respondent_id    :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :respondent_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  validate :respondent_did_not_author_poll
  validate :respondent_has_not_already_answered_question

  def sibling_responses
    self.question.responses.where( '? IS NULL OR responses.id != ?', id, id )
  end

  def respondent_has_not_already_answered_question
    if sibling_responses.any? { |response| response[:respondent_id] == respondent_id}
      errors[:siblings] << "Respondent has already responded to this questions."
    end
  end

  def respondent_did_not_author_poll
    if question.poll.author_id == respondent_id
      errors[:respondent] << "Stop trying to rig the results!!!"
    end
  end
end
