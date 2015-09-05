class Book
  include Lotus::Entity
  attributes :title, :author, :percent_read

  def finished?
    percent_read == 100
  end
end
