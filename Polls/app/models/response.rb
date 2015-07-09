class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :respondent_is_not_author

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    siblings = question.responses
    siblings = siblings.where('responses.id != ?', id) if id
    siblings
  end

  private

  def respondent_has_not_already_answered_question
    if sibling_responses.exists?(:user_id => user_id)
      errors[:respondent] << "Can't answer question twice"
    end
  end

  def respondent_is_not_author
    if user_id == question.poll.author_id
      errors[:respondent] << "Can't answer a question in your own poll."
    end
  end
end
