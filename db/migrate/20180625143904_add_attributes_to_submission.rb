class AddAttributesToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :dept, :string
    add_column :submissions, :bug_or_idea, :string
    add_column :submissions, :product, :string
    add_column :submissions, :steps_to_reproduce, :string
    add_column :submissions, :expected_results, :string
    add_column :submissions, :frequency, :string
    add_column :submissions, :urgency, :string
    add_column :submissions, :audience, :string
    add_column :submissions, :how_to_solve, :string
    add_column :submissions, :benefit, :string
    add_column :submissions, :must_have, :string
    add_column :submissions, :should_have, :string
    add_column :submissions, :nice_to_have, :String
  end
end
