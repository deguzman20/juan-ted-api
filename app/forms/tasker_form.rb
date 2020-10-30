class TaskerForm
  include Virtus.model
  include ActiveModel::Model

  attribute :first_name, String
  attribute :last_name, String
  attribute :mobile_number, String
  attribute :email, String
  attribute :password, String

  def initialize(attr = {})
    return if attr.nil?
    
    self[:first_name] = attr["first_name"] || ""
    self[:last_name] = attr["last_name"] || ""
    self[:mobile_number] = attr["mobile_number"] || ""
    self[:email] = attr["email"] || ""
    self[:password] = attr["password"] || ""
  end

  def save
    if valid?
      create_tasker
      true
    else
      false
    end
  end

  private

    def create_tasker
      a = Tasker.create(first_name: self[:first_name], last_name: self[:last_name],
                mobile_number: self[:mobile_number], email: self[:email],
                password: self[:password])

      puts a.errors.full_messages
    end
end
