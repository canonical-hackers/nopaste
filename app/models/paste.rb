class Paste < ActiveRecord::Base
  belongs_to :user
  belongs_to :original, :class_name => 'Paste', :foreign_key => :original_id
  validates_presence_of :content, :language
  before_create :set_uuid

  self.primary_key = :uuid

  delegate :username, :to => :user

  LANGS = ['Text', 'Ruby', 'Perl', 'Python', 'PHP', 'C', 'C++', 'Java',
           'Bash', 'CSS', 'HTML', 'Javascript', 'JSON', 'YAML']

  def self.find_by_param(input)
    find_by_uuid(input)
  end

  def description
    return 'Untitled Paste' if read_attribute(:description).nil?
    super
  end

  def author
    return self.username if self.user.present?
    return 'Anonymous' if read_attribute(:author).nil?
    super
  end

  def self.public
    where(:private => false)
  end

  def set_uuid
    self.uuid = rand_uuid
  end

  def forks
    Paste.where(:original_id => self.uuid)
  end

  private

  def rand_uuid(size=24)
    (1..size).collect { (i = Kernel.rand(32); i += ((i < 10) ? 48 : 87 )).chr }.join.downcase
  end
end
