module Service
  class BaseWorker
    include Sidekiq::Worker

    sidekiq_options(
      backtrace: true,
      retry: false
    )
  end
end