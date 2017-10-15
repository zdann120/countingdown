class Clock < ApplicationRecord
  has_secure_token
  has_secure_token :slug

  attribute :public, :boolean, default: true
  attribute :human_time, :string, default: '24 hours from now'

  before_save :parse_human_time
  after_initialize :set_human_time

  def duration
    begin
      raise CountdownEndedError if (DateTime.now > countdown_to)
      DurTool::Duration.new((countdown_to - DateTime.now).to_i)
    rescue CountdownEndedError
      DurTool::Duration.new(0)
    end
  end

  def self.find(param)
    find_by_slug(param)
  end

  def to_param
    slug
  end

  private

  def parse_human_time
    #Chronic.time_class = DateTime.in_time_zone(time_zone)
    self.countdown_to = Chronic.
                          parse(human_time).
                          to_datetime.
                          in_time_zone(time_zone)
  end

  def set_human_time
    if persisted?
      self.human_time = countdown_to.to_s
    end
  end
  class CountdownEndedError < StandardError; end
end
