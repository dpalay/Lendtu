class User < ActiveRecord::Base
  has_many :identities




 def self.create_with_omniauth(info)
   create(name: info['info']['name'], first_name: info['info']['first_name'],
          last_name: info['info']['last_name'], email:  info['info']['email'])
 end

end
