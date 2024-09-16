module Searchable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name 'messages'

  settings do
    mappings dynamic: false do
      indexes :body, type: 'text'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        body: {
          query: {
            match: {
              body: query
            }
          }
        }
      }
    )
  end
end
