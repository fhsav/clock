module MongoMapper
  module Extensions
    module String
      def to_mongo(value)
        entities = HTMLEntities.new
        value.nil? ? nil : entities.decode(value.to_s)
      end

      def from_mongo(value)
        entities = HTMLEntities.new
        value.nil? ? nil : entities.decode(value.to_s)
      end
    end
  end
end
