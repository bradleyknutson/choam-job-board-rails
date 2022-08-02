require 'json'

class GetJobDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    board_token = JobBoard.first.job_board_token
    jobs_data = (JSON.parse HTTParty.get("https://boards-api.greenhouse.io/v1/boards/#{board_token}/jobs").body)["jobs"]
    jobs_data.each do |job|
      Job.create(json: job.to_json)
    end
  end
end
