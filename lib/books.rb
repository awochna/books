require 'lotus/model'
Dir["#{ __dir__ }/books/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/books_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/books_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/books_development'
  #    adapter type: :sql, uri: 'mysql://localhost/books_development'
  #
  adapter type: :sql, uri: ENV['BOOKS_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    # collection :users do
    #   entity     User
    #   repository UserRepository
    #
    #   attribute :id,   Integer
    #   attribute :name, String
    # end
    collection :books do
      entity Book
      repository BookRepository

      attribute :id, Integer
      attribute :title, String
      attribute :author, String
      attribute :percent_read, Integer
    end
  end
end.load!
