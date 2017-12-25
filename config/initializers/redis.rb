$redis = Redis::Namespace.new("bookstore", :redis => Redis.new)
::Domain::Book::Services::Cache::Invalidate.new.call unless Rails.env.test?