class Paste < ActiveRecord::Base
  attr_accessible :content
  before_create :set_uuid
  
  self.primary_key = :uuid

  def set_uuid
    self.uuid = rand_uuid
  end

  private    
    
  def rand_uuid(size=24)
    (1..size).collect { (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }.join.downcase
  end
end
