class AuthorRepository < Hanami::Repository
  associations do
    has_many :books
  end

  def find_with_books(id)
    aggregate(:books).by_pk(id).map_to(Author).one
  end

  def first_with_books
    aggregate(:books).map_to(Author).first
  end

  def create_with_books(data)
    assoc(:books).create(data)
  end
end
