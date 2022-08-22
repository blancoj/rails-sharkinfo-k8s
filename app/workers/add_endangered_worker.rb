class AddEndangeredWorker
  require 'csv'
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(csv_file)
    Rails.logger.info("AddEndangeredWorker")
    Rails.logger.info("file present?: #{csv_file.present?}")
    CSV.foreach(csv_file, headers: true) do |shark|
      Rails.logger.info("csv: #{shark[0]},#{shark[1]}")
      Endangered.create(name: shark[0], iucn: shark[1])
    end
 end

end
