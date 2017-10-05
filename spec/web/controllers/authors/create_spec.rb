require_relative '../../../spec_helper'

describe Web::Controllers::Authors::Create do
  let(:action) { Web::Controllers::Authors::Create.new }
  let(:params) do
    {
      first_name: 'Gerald Jay',
      last_name:  'Sussman',
      books: [
        { title: 'SICP' }
      ]
    }
  end

  it 'creates an Author' do
    response = action.call(params)

    author = AuthorRepository.new.first_with_books
    author.first_name.must_equal('Gerald Jay')
    author.last_name.must_equal('Sussman')
    author.books.count.must_equal(1)
  end

  after do
    BookRepository.new.clear
    AuthorRepository.new.clear
  end
end
