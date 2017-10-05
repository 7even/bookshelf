class AuthorRepository < Hanami::Repository
  associations do
    has_many :books
  end

  def find_with_books(id)
    aggregate(:books).where(id: id).one
  end
end
