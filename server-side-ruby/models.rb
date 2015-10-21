class Tracker < Sequel::Model
  def self.find_or_create_by_name name
    if found = first(Sequel.ilike(:name, name))
      found
    else
      Tracker.create(name: name)
    end
  end

  def to_json
    values.to_json
  end
end
