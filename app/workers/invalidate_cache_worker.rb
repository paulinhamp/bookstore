class InvalidateCacheWorker
  include Sidekiq::Worker

  def perform
    ::Domain::Book::Services::Cache::Invalidate.new.call
  end
end
