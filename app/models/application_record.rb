class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def created_at
    attributes['created_at'].strftime("%d/%m/%Y %H:%M")
  end
end
