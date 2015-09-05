class BookRepository
  include Lotus::Repository

  def self.finished
    query do
      where(percent_read: 100)
    end.all
  end

  def self.unfinished
    query do
      where(percent_read: 0...100)
    end.all
  end
end
