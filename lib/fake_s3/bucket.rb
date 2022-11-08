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

    def objects(opts = {})
      @objects
        .find_all do |key, obj| 
          obj.exists? && (!opts[:prefix] || key.starts_with?(opts[:prefix]))
        end
        .map {|_key, obj| obj }
    end

    def object(key)
      @objects[key] ||= FakeS3::Object.new(self, key, nil)
    end

    def delete_objects(args) 
      args[:delete][:objects].each do |objects|
        @objects.delete(objects[:key])
      end
    end

    # this is a method for tests to see the contents of a fake bucket
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
