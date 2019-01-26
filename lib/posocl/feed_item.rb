class Posocl::FeedItem < Struct.new(:title, :description, :image_url, :published_at, :duration, :url, :file_path)
  def parametrized_title
    title.gsub(/\s/, '_')
  end
end
