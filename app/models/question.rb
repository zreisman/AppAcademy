# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  poll_id       :integer          not null
#  question_text :text             not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Question < ActiveRecord::Base
  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )

  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
  :responses,
  through: :answer_choices,
  source: :responses
  )

  def title
    question_text
  end

  def results
    results = {}
    answer = answer_choices
    answer.each do |choice|
      results[choice.answer_text] = choice.responses.length
    end
    results
  end
end
