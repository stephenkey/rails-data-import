class Datum < ActiveRecord::Base
  attr_accessible :title, :quantity, :condition, :description

  # A method to check if the file is an acceptable format and use the 'roo' gem to open the file.
	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
		  when ".csv" then Csv.new(file.path, nil, :ignore)
		  when ".xls" then Excel.new(file.path, nil, :ignore)
		  when ".xlsx" then Excelx.new(file.path, nil, :ignore)
		  else raise "Unknown file type: #{file.original_filename}"
	  end
	end

end
