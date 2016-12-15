class User < ApplicationRecord
	has_many :locks
  enum access_level: { student: 0, teacher: 1, admin: 2 }

	def self.from_omniauth(auth)
		where(username: auth.info.email.split("@").first).first || create_from_omniauth(auth)
		# User.import_from_ldap(auth.info.email.split("@").first)
		# user = User.find_by(username: auth.info.email.split("@").first)
		# return user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.username = auth.info.email.split("@").first
			user.access_level = 1 if auth.info.email.split("@").last == 'puhsd.org'
			user.firstname = auth.info.first_name
			user.lastname = auth.info.last_name
    end
  end



end
