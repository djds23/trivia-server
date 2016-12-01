def data
  file = File.open('./irc_trivia_dataset/out/1478579193_out.json', 'r')
  JSON.load(file).with_indifferent_access
end

task import_irc: :environment do
  data.each do |category, questions|
    category = Category.where(title: category.downcase).first_or_create!
    questions.each do |question|
      Card.create! do |c|
        c.question = question['question']
        c.answer = question['answer']
        c.category = category
      end
    end
  end
end

