module RouteConstraints
  class UserExists
    def self.matches?(request)
      User.find_by_request(request).present?
    end
  end
end