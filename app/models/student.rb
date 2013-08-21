require_relative '../../db/config'

class Student < ActiveRecord::Base

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :email, uniqueness: true
  validates :age, :numericality => { greater_than: 5}
  validates :phone, format: {with: /\.*\d{3}.*\d{3}.*\d{4}/}

  def name
    first_name +  " " + last_name
  end 
  
  def age
    now = Date.today
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
end

# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not an email")
#     end
#   end
# end
# implement your Student model here



