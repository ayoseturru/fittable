class Exercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication
  before_save :set_series_and_repeats

  scope :day, -> (day) { where(:day => day) }


  def translate_day_to_spanish
    case self.day
      when 'monday'
        'lunes'
      when 'tuesday'
        'martes'
      when 'wednesday'
        'miércoles'
      when 'thursday'
        'jueves'
      when 'friday'
        'viernes'
      when 'saturday'
        'sábado'
      when 'sunday'
        'domingo'
    end
  end

  private
  def set_series_and_repeats
    self.series ||=0
    self.repeats ||=0
  end

end
