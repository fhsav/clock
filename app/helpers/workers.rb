Clock.helpers do
  S3_UPLOAD = GirlFriday::WorkQueue.new(:s3_upload, :size => 5) do |w|
    S3.files.create(
      :key => w[:filename],
      :body => w[:tempfile],
      :content_type => w[:type],
      :public => true
    )
  end

  S3_DELETE = GirlFriday::WorkQueue.new(:s3_delete, :side => 5) do |w|
    f = S3.files.get(:object_name => w[:name])

    if f
      f.destroy
    end
  end
end