class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  has_many :library, :class_name => "Book", :foreign_key => :owner_id
  has_many :checked_out, :class_name => "Book", :foreign_key => :borrower_id
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :id, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
end