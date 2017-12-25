ENV["ELASTICSEARCH_URL"] = Settings.elasticsearch.url
Searchkick.disable_callbacks if Rails.env.test?
