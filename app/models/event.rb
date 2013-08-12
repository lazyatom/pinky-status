class Event < ActiveRecord::Base
  before_create :infer_status

  def self.most_recent
    order(['created_at desc']).first
  end

  def self.most_recent_status
    most_recent ? most_recent.status : nil
  end

  def self.next_status
    if most_recent_status
      most_recent_status == 'in' ? 'out' : 'in'
    end
  end

  private

  def infer_status
    Rails.logger.info "status: #{self.status.inspect}"
    self.status ||= self.class.next_status
    Rails.logger.info "status: #{self.status}; #{self.class.most_recent_status} / #{self.class.next_status}"
  end
end
