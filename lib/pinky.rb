module Pinky
  class << self
    def in(time_string)
      create_event('in', time_string)
    end

    def out(time_string)
      create_event('out', time_string)
    end

    def flip(start_event, end_event)
      events = Event.where(id: start_event..end_event)
      events.each do |e|
        if e.status == 'in'
          e.update_attribute('status', 'out')
        else
          e.update_attribute('status', 'in')
        end
      end
    end

    private

    def create_event(status, time_string)
      time = Time.parse(time_string)
      Event.create(status: status, source: 'manual', created_at: time, updated_at: time)
    end
  end
end
