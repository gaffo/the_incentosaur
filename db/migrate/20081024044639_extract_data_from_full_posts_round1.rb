class ExtractDataFromFullPostsRound1 < ActiveRecord::Migration
  def self.up
    Feed.find(:all, :conditions => {:authorxpath => 'dc:creator'}).each{|f| f.posts.each{|p| p.delete}}
    Post.find(:all).each do |post|
      doc = REXML::Document.new(post.full_post).root
      post.feed.automatic_xpaths.each do |path_name|
        attr = path_name.to_s.gsub(/_xpath$/, '')
        setter = "#{attr}=".to_sym
        attr = attr.to_sym
        xpath = post.feed.send(path_name)
        value = text_or_empty(doc.elements[xpath])
        post.send(setter, value)
      end
      post.save(false)
    end
  end

  def self.down
  end


  def self.text_or_empty(element)
    return element.text if element
    ""
  end
end
