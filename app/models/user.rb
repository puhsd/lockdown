class User < ApplicationRecord
	has_many :locks
  enum access_level: { student: 0, teacher: 1, admin: 2 }

	def self.google_sign_in(auth)
		where(username: auth.email_address.split("@").first).first || create_from_omniauth(auth)
	end

	def self.create_from_google_sign_in(auth)
    create! do |user|
      user.username = auth.email_address.split("@").first
			user.access_level = 1 if auth.info.email_address.split("@").last == ENV["DOMAIN_EDING"]
			user.firstname = auth.given_name
			user.lastname = auth.last_name
    end if auth.email_address.split("@").last == ENV["DOMAIN_EDING"]
  end


	def self.from_omniauth(auth)
		where(username: auth.info.email.split("@").first).first || create_from_omniauth(auth)
		# User.import_from_ldap(auth.info.email.split("@").first)
		# user = User.find_by(username: auth.info.email.split("@").first)
		# return user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.username = auth.info.email.split("@").first
			user.access_level = 1 if auth.info.email.split("@").last == ENV["DOMAIN_EDING"]
			user.firstname = auth.info.first_name
			user.lastname = auth.info.last_name
    end if auth.info.email.split("@").last == ENV["DOMAIN_EDING"]
  end



end
