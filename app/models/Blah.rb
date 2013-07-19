class Blah < ActiveRecord::Base
  attr_accessible :url
  mount_uploader :url, FileUploader
end
