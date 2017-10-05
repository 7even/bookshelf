Hanami::Model.migration do
  change do
    alter_table :books do
      add_column :info, :jsonb, null: false, default: '{}'
      drop_column :created_at
      drop_column :updated_at
    end
  end
end
