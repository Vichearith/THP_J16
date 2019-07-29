class Gossip
attr_accessor :author, :content , :comment

  def initialize(author, content)
    @author = author
    @content = content
  end
  
  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    return Gossip.all[id]
  end

  def self.update(id_update, author, content)
    gossips = Gossip.all
    CSV.open("db/gossip.csv", "w+")
    gossips.each_with_index {|gossip, index|
      if id_update == index
        gossip = Gossip.new(author, content).save
      else
        gossip.save
      end
      }
  end

end