class User < ApplicationRecord
	has_many :locks

	def self.from_omniauth(auth)
		where(username: auth.info.email.split("@").first).first || create_from_omniauth(auth)
		# User.import_from_ldap(auth.info.email.split("@").first)
		# user = User.find_by(username: auth.info.email.split("@").first)
		# return user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.username = auth.info.email.split("@").first
    end
  end

end
