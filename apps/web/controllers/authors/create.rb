module Web::Controllers::Authors
  class Create
    include Web::Action

    params do
      required(:first_name).filled(:str?)
      required(:last_name).filled(:str?)

      optional(:books).each do
        schema do
          required(:title).filled(:str?)
          required(:info).filled(:hash?)
        end
      end
    end

    def call(params)
      if params.valid?
        AuthorRepository.new.create_with_books(params.to_h)
        status 201, JSON.dump(status: 'Created')
      else
        status 422, JSON.dump(params.errors)
      end
    end
  end
end
