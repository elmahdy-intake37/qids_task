class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

def self.search(search)
  if search
      name = "#{search}".downcase
      joins(:user).where("lower(users.username)=?",name)
  else
    find(:all)
  end
end


end
