class Request < ActiveRecord::Base

  validates_presence_of :name, :email

  after_initialize :set_default

  def self.search(term, page)
    paginate :per_page => 10, :page => page,
            :conditions => ["name ilike ? OR message ilike ? OR email ilike ? ", "%#{term}%", "%#{term}%", "%#{term}%"],
            :order => "done desc"
  end

  private

  def set_default
    self.done = "Not Done" unless self.done == "Done"

  end

end
