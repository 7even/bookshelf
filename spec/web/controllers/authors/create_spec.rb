require_relative '../../../spec_helper'

describe Web::Controllers::Authors::Create do
  let(:action) { Web::Controllers::Authors::Create.new }
  let(:params) do
    {
      first_name: 'Gerald Jay',
      last_name:  'Sussman',
      books: [
        { title: 'SICP', info: { released_in: 1985 } }
      ]
    }
  end

  it 'creates an Author' do
    response = action.call(params)

    author = AuthorRepository.new.first_with_books
    author.first_name.must_equal('Gerald Jay')
    author.last_name.must_equal('Sussman')
    author.books.count.must_equal(1)
    author.books.first.info[:released_in].must_equal(1985)
  end

  after do
    BookRepository.new.clear
    AuthorRepository.new.clear
  end
end
