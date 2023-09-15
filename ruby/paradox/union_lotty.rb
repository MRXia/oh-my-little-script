# Union Lotto Lottery Simulation

class UnionLotto
  attr_reader :red_balls, :blue_ball
  @@lottery_rules = [
    { red_match_count: 6, blue_match: true, prize_level: 1 },
    { red_match_count: 6, blue_match: false, prize_level: 2 },
    { red_match_count: 5, blue_match: true, prize_level: 3 },
    { red_match_count: 5, blue_match: false, prize_level: 4 },
    { red_match_count: 4, blue_match: true, prize_level: 4 },
    { red_match_count: 4, blue_match: false, prize_level: 5 },
    { red_match_count: 3, blue_match: true, prize_level: 5 },
    { red_match_count: 0, blue_match: true, prize_level: 6 },
  ]

  def initialize
    @red_balls = (1..33).to_a.sample 6
    @blue_ball = (1..16).to_a.sample
  end

  def prize_check(lottery)
    red_match_count = (@red_balls & lottery.red_balls).size
    blue_match = @blue_ball == lottery.blue_ball
    rule = @@lottery_rules.detect do |rule| 
      red_match_count >= rule[:red_match_count] && blue_match == rule[:blue_match]
    end
    prize = rule&.fetch(:prize_level)
  end
end

class Lottery
  attr_reader :red_balls, :blue_ball

  def initialize
    @red_balls = (1..33).to_a.sample 6
    @blue_ball = (1..16).to_a.sample
  end
end

lottery_number = ARGV[0]&.to_i || 10
ul = UnionLotto.new
puts "*\tred balls: #{ul.red_balls.sort}, blue ball: #{ul.blue_ball}"
statistics = [0] * 6
(1..lottery_number).each do |c|
  lottery = Lottery.new
  prize = ul.prize_check lottery
  # puts %Q(#{c}\tred balls: #{lottery.red_balls.sort}, blue ball: #{lottery.blue_ball}; #{"win the #{prize} prize" if prize})
  statistics[prize - 1] += 1 if prize
end

puts "in #{lottery_number} lottery"
statistics.each_with_index do |count, i|
  puts "win the #{i + 1} prize #{count} times"
end