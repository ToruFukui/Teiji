class Article < ActiveRecord::Base
   
   validates :content,:name,:title,:presence => true

end
