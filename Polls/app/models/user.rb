class User < ActiveRecord::Base
  validates :user_name, presence: true

  has_many(
    :authored_polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :user_id,
    primary_key: :id
  )

  def completed_polls
    Poll.find_by_sql([<<-SQL, id])
      SELECT
        polls.*
      FROM
        polls
      JOIN
        questions ON polls.id = questions.poll_id
      LEFT JOIN (
        SELECT
          responses.*, answer_choices.question_id AS question_id
        FROM
          responses
        JOIN
          answer_choices ON responses.answer_choice_id = answer_choices.id
        WHERE
          responses.user_id = ?
        ) responses
        ON questions.id = responses.question_id
      GROUP BY
        polls.id
      HAVING
        COUNT(questions.id) = COUNT(responses.id)
    SQL

    # ActiveRecord way
    # Poll.all.select('polls.*')
    #   .joins(:questions).joins(:answer_choices)
    #   .joins(
    #     Response.all.select()
    #   )

  end

end
