class Identity < ActiveRecord::Base
  belongs_to :user

  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider'])
  end

  def self.create_with_omniauth(auth)
      create(uid: auth['uid'], provider: auth['provider'],
             oauth_token: auth['credentials']['token'], oauth_expires_at: auth['credentials']['expires_at'],
             image: auth['image'])
  end

  def self.create_with_new_user(user)
    create(uid: user[:id], provider: 'LendTu', user_id: user[:id])
  end
end

