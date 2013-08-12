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

  def self.most_recent_outing_events
    most_recent_in = order(['created_at desc']).where(status: 'in').first
    most_recent_out = order(['created_at desc']).where("created_at < ?", most_recent_in.created_at).first
    [most_recent_out, most_recent_in]
  end

  private

  def infer_status
    self.status ||= self.class.next_status
  end
end
