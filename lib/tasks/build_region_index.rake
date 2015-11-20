namespace :location do
  desc "build index"
  task :index => :environment do
    name_path = Hash.new { |h, k| h[k] = []}
    ids_path = Hash.new { |h, k| h[k] = []}
    split = '|'
    Location.all.each do |l|
      l.name_path = calculate(name_path, l, :name).join(split)
      l.ids_path  = calculate(ids_path, l, :id).join(split)
      puts "-id => #{l.id} -name_path => #{l.name_path} -ids_path => #{ids_path}"
      l.save
    end
    name_path = nil
    ids_path  = nil
  end

  def calculate(cache, location, attribute)
    return cache[location.id] unless cache[location.id].empty?
    parent = location
    while parent
      cache[location.id].insert(0,parent.send(attribute))
      parent = parent.parent
    end
    return cache[location.id]
  end
end