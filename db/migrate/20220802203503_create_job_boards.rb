class CreateJobBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :job_boards do |t|
      t.string :job_board_token
    end
  end
end
