require "radiant-heroku_memcached-extension"

class HerokuMemcachedExtension < Radiant::Extension
  version     RadiantHerokuMemcachedExtension::VERSION
  description RadiantHerokuMemcachedExtension::DESCRIPTION
  url         RadiantHerokuMemcachedExtension::URL

  extension_config do |config|
    if ENV['MEMCACHE_SERVERS'].present?
      require "memcached"

      cache = Memcached.new
      config.cache_store = :mem_cache_store, Memcached::Rails.new
      config.middleware.delete ::Radiant::Cache
      config.middleware.use ::Radiant::Cache, :metastore => cache, :entitystore => cache
    end
  end
end
