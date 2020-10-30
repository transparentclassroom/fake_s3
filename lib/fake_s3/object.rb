module FakeS3
  class Object
    attr_reader :key
    attr_reader :bucket
    attr_accessor :last_modified

    def initialize(bucket, key, body)
      @bucket, @key, @body = bucket, key, body
      @last_modified = Time.now
      @content_length = 1
    end

    def exists?
      !!@body
    end

    def content_length
      @body.length # this should be in bytes, but this is roughly the same, good enough for tests
    end

    def put(options = {})
      if options[:body]
        @body = options[:body]
      end
      self
    end

    def get
      FakeObjectOutput.new(@body)
    end

    def download_file(path)
      File.open(path, 'wb') do |f|
        f << @body
      end
    end

    def upload_file(source, options = {})
      @body = source.respond_to?(:read) ? source.read : File.read(source)
    end

    def move_to(location)
      location.bucket.move_to(self, location)
    end

    def public_url
      "https://test.com.s3.amazonaws.com/#{@key}"
    end

    def presigned_url
      "https://test.com.s3.amazonaws.com/#{@key}?X-Amz-Algorithm=presigned"
    end

    class FakeObjectOutput
      def initialize(body)
        @body = body
      end

      def body
        StringIO.new(@body)
      end
    end
  end
end
