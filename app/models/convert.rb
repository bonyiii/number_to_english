class Convert < ActiveRecord::Base

  validates_numericality_of :arabic

  attr_accessible :arabic

  Ones = %w(zero one two three four five six seven eight nine)
  Teen = %w[ ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen ]
  Tens = %w[ zero ten twenty thirty forty fifty sixty seventy eighty ninety ]
  Thousands = %w[ none thousand million billion ]
  
  def to_english(number)
    groups = number.to_s.split(//).map {|number| number.to_i }.reverse
    words = []
    ((groups.length + 2) / 3).times do |group|
      group_words = thousand_group(groups[ group * 3, 3 ])
      words << " #{Thousands[group]} " if group_words.length > 0 && group > 0
      words += group_words
    end
    
    words << 'minus ' if(number < 0)
    
    words.reverse.join
  end

  private

  def thousand_group(numbers)
    word = []

    # Checking 10 -19 
    if numbers[1] == 1
      word << Teen[numbers[0]]
    # Checking 20 - 99
    elsif numbers[1] && numbers[1] > 1
      word << (numbers[0] > 0 ? "#{Tens[numbers[1]]} #{Ones[numbers[0]]}" : Tens[numbers[1]])
    # Checking 0 - 9      
    elsif numbers[0] > 0
      word << Ones[numbers[0]]
    end
    
    # Checking hundreds
    if numbers[2] && numbers[2] > 0
    word << "#{Ones[numbers[2]]} hundred "
    end

    # Checking zero
    if !numbers[2] && !numbers[1] && numbers[0] == 0
      word << Ones[numbers[0]]
    end

    word
  end

end
