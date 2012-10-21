class Paste < ActiveRecord::Base
  attr_accessible :content, :language, :author, :description
  validates_presence_of :content, :language 
  before_create :set_uuid
  
  self.primary_key = :uuid


  LANGS = ['Text', 'Ruby', 'Perl', 'Python', 'PHP', 'C', 'C++', 'Java', 
           'Bash', 'CSS', 'HTML', 'Javascript', 'JSON', 'YAML']

  def set_uuid
    self.uuid = rand_uuid
  end

  private    
    
  def rand_uuid(size=24)
    (1..size).collect { (i = Kernel.rand(32); i += ((i < 10) ? 48 : 87 )).chr }.join.downcase
  end
end
