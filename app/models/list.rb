class List < ActiveRecord::Base
 has_many :items , autosave: :true, dependent: :delete_all 

end
