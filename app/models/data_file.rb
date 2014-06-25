class DataFile < ActiveRecord::Base
  def self.save(upload,folder,id)
    name =  upload['files'].original_filename
    directory = "public/#{folder}/#{id.to_s}"
    unless File.exists?(directory)
      FileUtils.mkdir(directory)
    end
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['files'].read) }
  end
end