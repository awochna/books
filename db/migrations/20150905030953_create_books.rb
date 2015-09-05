Lotus::Model.migration do
  change do
    create_table :books do
      primary_key :id
      column :title,        String, null: false
      column :author,       String, null: false
      column :percent_read, Integer
    end
  end
end
