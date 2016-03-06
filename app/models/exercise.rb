class Exercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication

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

end
