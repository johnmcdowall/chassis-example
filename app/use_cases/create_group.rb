class CreateGroup
  attr_reader :form, :current_user

  def initialize(form, current_user)
    @form, @current_user = form, current_user
  end

  def run!
    form.validate!

    group = Group.new do |group|
      group.name = form.name
      group.admin = current_user

      group.users = form.phone_numbers.map do |number|
        UserRepo.find_by_phone_number! number
      end
    end

    group.users << current_user

    group.save

    group
  end
end