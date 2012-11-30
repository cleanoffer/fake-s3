module FakeS3
  class S3Object
    include Comparable
    attr_accessor :name,:size,:creation_date,:modified_date,:md5,:io,:content_type

    def hash
      @name.hash
    end

    def eql?(object)
      @name == object.name
    end

    # Sort by the object's name
    def <=>(object)
      @name <=> object.name
    end

    def modified_http_date
      Time.parse(modified_date).httpdate()
    end

    def modified_s3_date
      Time.parse(modified_date).getutc.strftime("%Y-%m-%dT%H:%M:%SZ")
    end
  end
end
