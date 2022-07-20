class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :school

  enum role: [:student, :teacher, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :student
  end

  def self.find_by_request(request)
    uri = URI(request.original_url)

    if uri.host =~
      /(127.0.0.1|localhost|192.168|0.0.0.0:3000|lms.com)/
      begin
        find_by(domain: request.params[:domain])
      rescue StandardError
        nil
      end
    else
      find_by(domain: request.subdomain)
    end
  end

end
