Clock.helpers do
  class S3
    class << self
      def store(*args)
        AWS::S3::S3Object.store(args)
      end

      def find(*args)
        AWS::S3::S3Object.find(args)
      end

      def delete(*args)
        AWS::S3::S3Object.delete(args)
      end
    end
  end
end 