class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "200x200>" },
  :default_url => "/images/missing.png"

	validates_attachment_content_type :avatar,
  :content_type => /\Aimage\/.*\Z/

  validates_presence_of :firstname
  validates_presence_of :lastname

  geocoded_by :address
  after_validation :geocode
  
  has_and_belongs_to_many :places

end
