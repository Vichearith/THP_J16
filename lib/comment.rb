class Comment
  attr_accessor :author, :content , :gossip_id, :comments_array
  
    def initialize(gossip_id, author, content)
      @author = author
      @content = content
      @gossip_id = gossip_id
    end
    
    def save
      CSV.open("db/comment.csv", "ab") do |csv|
        csv << [@gossip_id, @author, @content]
      end
    end
  
    def self.all(id)
      all_comment = []
      CSV.read("db/comment.csv").each_with_index do |csv_line,index|
        if index == id
          all_comment << Gossip.new(@gossip_id, @author, @content)
        end
      end
      return all_comment
    end
  
  end