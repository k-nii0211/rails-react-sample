json.data(@comments) { |comment| json.extract!(comment, :author, :text)}