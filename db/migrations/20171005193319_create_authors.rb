Hanami::Model.migration do
  change do
    create_table :authors do
      primary_key :id

      column :first_name, String, null: false
      column :last_name,  String, null: false
    end

    alter_table :books do
      drop_column :author
      add_foreign_key :author_id, :authors
    end
  end
end
