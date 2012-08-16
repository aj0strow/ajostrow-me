# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  finished_at :datetime
#  name        :string(255)
#  blurb       :string(255)
#  description :text
#  project_url :string(255)
#  code_url    :string(255)
#  language    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Project < ActiveRecord::Base
  
  attr_accessible :name, :blurb, :language, :project_url, :code_url, :finished_at, :description
    
  validates :name, presence: true, uniqueness: true
  validates :blurb, presence: true
  validates :language, presence: true
  validates :project_url, format: URI::regexp( %w[ http https ] )
  validates :code_url, format: URI::regexp( %w[ http https ] )
  validates :finished_at, presence: true
  validates :description, presence: true, length: { maximum: 10_000 }

  def finished_at=(date)
    write_attribute :finished_at, date.to_datetime
  end
  
  def finished_at
    date = read_attribute :finished_at
    if date
      date.strftime "%b %-d, %Y"
    else
      ''
    end
  end
  
end
