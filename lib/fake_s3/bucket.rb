module FakeS3
  class Bucket
    attr_reader :name

    def initialize(name)
      @name = name
      clear
    end

    def clear
      @objects = {}
    end

    def objects(_ = {})
      @objects.keep_if(&:exists?)
    end

    def object(key)
      @objects[key] ||= FakeS3::Object.new(self, key, nil)
    end

    def keys_to_contents
      @objects.map_to_hash do |key, obj|
        [key, obj.get.body.read]
      end
    end

    def move_to(src, dest)
      @objects[dest.key] = @objects.delete(src.key)
    end
  end
end
