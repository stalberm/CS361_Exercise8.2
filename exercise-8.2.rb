class Player
  attr_reader :name

  def initialize(name)
      @name = name
  end
end

class PokerPlayer < Player
  attr_reader :hand

  def initialize(name, hand)
      super(name)
      @hand = hand
  end
end

class ChessPlayer < Player
  attr_reader :color

  def initialize(name, color)
    super(name)
    @color = color
  end
end

class GoPlayer < Player
  attr_reader :color
  
  def initialize(name, color)
    super(name)
    @color = color
  end
end

class Game
  attr_reader :players
  
  def initialize(players)
    @players = players
  end

  def play()
    puts "Players in the #{self.class.name} game:"
  end

  def get_results()
    "[pretend these are #{self.class.name} results]"
  end
end


class Poker < Game
  def initialize(players)
    super(players)
  end

  def play()
    super
    @players.each { |player| puts "#{player.name}: #{player.hand}" }
    # [pretend there's code here]
  end

end

class Go < Game
  def initialize(players)
    super(players)
  end

  def play()
    super
    @players.each { |player| puts "#{player.name}: #{player.color}" }
    # [pretend there's code here]
  end

end

class Chess < Game
  def initialize(players)
    @players = players
  end

  def play()
    super
    @players.each { |player| puts "#{player.name}: #{player.color}" }
    # [pretend there's code here]
  end

end


players = []
["alice", "bob", "chris", "dave"].each { |x| players.append(PokerPlayer.new(x, nil)) }
game = Poker.new(players)
game.play

puts

players = []
[["alice", "white"], ["bob", "black"]].each { |x, y| players.append(GoPlayer.new(x, y)) }
game = Go.new(players)
game.play

puts

game = Chess.new(players)
[["alice", "white"], ["bob", "black"]].each { |x, y| players.append(ChessPlayer.new(x, y)) }
game.play


