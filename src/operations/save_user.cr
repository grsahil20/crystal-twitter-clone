class SaveUser < User::SaveOperation
  permit_columns email, name, user_name

  before_save do
    validate_required email
    validate_uniqueness_of email
    validate_uniqueness_of user_name
  end

  # before_save reject_scary_monsters

  # def reject_scary_monsters
  #   email.add_error "Mmmyyaahhh!" if email.value == "ich.heisse.sahil@gmail.comm"
  # end
end
