class Event < ApplicationRecord
  has_many :parties
  has_many :users, through: :parties
  belongs_to :user
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates :name, presence: true, length: { maximum: 50 }

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, :styles => {
    :thumb    => ['200x200#',  :jpg, :quality => 70],
    :preview  => ['480x480#',  :jpg, :quality => 70],
    :large    => ['600>',      :jpg, :quality => 70],
    :retina   => ['1200>',     :jpg, :quality => 30]
  },
  :convert_options => {
    :thumb    => '-set colorspace sRGB -strip',
    :preview  => '-set colorspace sRGB -strip',
    :large    => '-set colorspace sRGB -strip',
    :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
  },
  :url => "http://fiesto-app.s3.amazonaws.com/images/:attachment/:id/:basename_:style.:extension"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.name_by_id(search)
    where("id = ?", "#{search}").select(:name)
  end

  def self.user_deletion(u_id)
    where("user_id = ?" , "#{u_id}")
  end
  
end
