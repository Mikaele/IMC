class DataFile < ActiveRecord::Base
  def self.save(upload,folder,id,named)
    if upload["#{named}"]
      name =  upload["#{named}"].original_filename
      directory = "#{Rails.root}/public/#{folder}/#{id.to_s}"
      unless File.exists?(directory)
        FileUtils.mkdir(directory)
      end
      # create the file path
      path = File.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(upload["#{named}"].read) }
    end
  end
end