class User < ActiveRecord::Base
	
	has_attached_file(
		:avatar,
		:styles => { :small => "40x40>", :medium => "100x100>", :large => "300x300" }
	)
	
	validates_attachment :avatar, :size => { :in => 0..200.kilobytes }
	
	def name
		"#{self.first_name} #{self.last_name}"
	end
	
	def get_avatar_url(size)
		if self.avatar.present?
			self.avatar.url(size)
		else
			"http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=#{dimension_for_size(size)}&d=mm"
		end
	end
	
	def dimension_for_size(size)
		case size
			when :small
				40
			when :medium
				100
			when :large
				300
		end
	end
end
