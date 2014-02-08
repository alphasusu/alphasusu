class User < ActiveRecord::Base
  belongs_to :course
	
	has_attached_file(
		:avatar,
		:styles => { :small => "40x40>", :medium => "100x100>", :large => "300x300" },
		:path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
		:url => "/system/:class/:attachment/:id/:style/:basename.:extension"
	)
	
	validates_attachment :avatar, :size => { :in => 0..200.kilobytes }
	
	def name
		"#{self.first_name} #{self.last_name}"
	end

	def get_email_address
		if self.email.include? "@"
			self.email
		else
			"#{self.email}@soton.ac.uk"
		end
	end
	
	def get_avatar_url(size)
		if self.avatar.present?
			self.avatar.url(size)
		else
			"http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.get_email_address)}?s=#{dimension_for_size(size)}&d=mm"
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

	def self.years
		@years = {
			'Found.' => 'Foundation',
			'1' => 'Year 1',
			'2' => 'Year 2',
			'3' => 'Year 3',
			'4' => 'Year 4',
			'5' => 'Year 5',
			'PG' => 'Post Graduate',
			'alumni' => 'Alumni',
		}
	end

	def get_year
		self.class.years[self.year]
	end
end
