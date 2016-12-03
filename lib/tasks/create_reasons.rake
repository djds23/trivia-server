task create_reasons: :environment do
  Reason.where(
    machine_name: 'wrong_answer',
    display_name: 'Incorrect answer'
  ).first_or_create!

  Reason.where(
    machine_name: 'nonsense',
    display_name: 'Nonsensical card'
  ).first_or_create!

  Reason.where(
    machine_name: 'grammer_or_spelling',
    display_name: 'Incorrect grammar or spelling'
  ).first_or_create!

  Reason.where(
    machine_name: 'offensive',
    display_name: 'Offensive Content'
  ).first_or_create!
end
