class Request < ActiveRecord::Base

  validates_presence_of :name, :email

  after_initialize :set_default

  private

  def set_default
    self.done = "Not Done" unless self.done == "Done"

  end

end
