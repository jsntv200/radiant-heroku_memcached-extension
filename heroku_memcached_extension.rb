require "radiant-heroku_memcached-extension"

class HerokuMemcachedExtension < Radiant::Extension
  version     RadiantHerokuMemcachedExtension::VERSION
  description RadiantHerokuMemcachedExtension::DESCRIPTION
  url         RadiantHerokuMemcachedExtension::URL

  extension_config do |config|
    if Rails.env.production?
      require "memcached"
      cache = Memcached.new

      begin
        if cache.stats.present?
          config.cache_store = :mem_cache_store, Memcached::Rails.new
          config.middleware.delete ::Radiant::Cache
          config.middleware.use ::Radiant::Cache, :metastore => cache, :entitystore => cache
        end
      rescue Memcached::SomeErrorsWereReported => e
        puts %{Memcached #{e}. Is the Heroku memcache addon installed? http://devcenter.heroku.com/articles/memcache#deploying_to_heroku}
      end
    end
  end
end
