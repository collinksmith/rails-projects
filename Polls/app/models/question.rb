class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  def results
    # N + 1
    # answer_choices.each_with_object({}) do |choice, results|
    #   results[choice.answer] = choice.responses.count
    # end

    # Pre-fetch
    # answer_choices.includes(:responses).each_with_object({}) do |choice, results|
    #   results[choice.answer] = choice.responses.length
    # end

    # SQL Query
    # counts = AnswerChoice.find_by_sql([<<-SQL, id])
    #   SELECT
    #     answer_choices.*, COUNT(responses.id) AS num_responses
    #   FROM
    #     answer_choices
    #   LEFT JOIN
    #     responses ON responses.answer_choice_id = answer_choices.id
    #   WHERE
    #     answer_choices.question_id = ?
    #   GROUP BY
    #     answer_choices.id
    # SQL

    # ActiveRecord Query
    counts = answer_choices
      .select('answer_choices.*, COUNT(responses.id) AS num_responses')
      .joins('LEFT JOIN responses on responses.answer_choice_id = answer_choices.id')
      .where('answer_choices.question_id = ?', id)
      .group('answer_choices.id')

    counts.each_with_object({}) do |choice, results|
      results[choice.answer] = choice.num_responses
    end

  end

end
