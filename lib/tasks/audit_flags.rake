task audit_flags: :environment do
  flags = [CardFlag.new(card: Card.last, reason: Reason.first)]# CardFlag.where(activated_at: nil)
  flags.each do |flag|
    puts "#{flag.card_id} has been flagged for #{flag.reason.display_name}!"
    puts "Question: #{flag.card.question}"
    puts "Answer:   #{flag.card.answer}"
    puts "y/n"
    input = STDIN.gets.chomp
    if input == 'y'
      puts "please confirm: y"
      confirm = STDIN.gets.chomp
      if confirm == 'y'
        flag.activated_at = Time.now
        flag.card.deactivated_at = Time.now
        flag.save!
        card.save!
        puts 'flagged'
      end
    end
  end
end

