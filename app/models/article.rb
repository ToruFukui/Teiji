class Article < ActiveRecord::Base
   
   has_many :responses,dependent: :destroy

   validates :content,:name,:title,:presence => true

end
