Sequel.migration do
  up do
    create_table(:trackers) do
      primary_key :id
      String :name, null: false
      Float :latitude
      Float :longitude
      Timestamp :date
      Integer :utc_date
    end
  end

  down do
    drop_table(:trackers)
  end
end
