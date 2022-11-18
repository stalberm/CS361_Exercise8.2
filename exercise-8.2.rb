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

  def get_results()
    "[pretend these are #{self.class.name} results]"
  end
end


class Poker < Game
  def initialize(players)
    super(players)
  end

  def play_poker()
    puts "Players in the poker game:"
    @players.each { |player| puts "#{player.name}: #{player.hand}" }
    # [pretend there's code here]
  end

end

class Go < Game
  def initialize(players)
    super(players)
  end

  def play()
    puts "Players in the go game:"
    @players.each { |player| puts "#{player.name}: #{player.color}" }
    # [pretend there's code here]
  end

end

class Chess < Game
  def initialize(players)
    @players = players
  end

  def play_game()
    puts "Players in the chess game:"
    @players.each { |player| puts "#{player.name}: #{player.color}" }
    # [pretend there's code here]
  end

end


class PlayGames

  def initialize(game_number, player_list)
    @player_list = player_list
    @game_number = game_number
  end

  def play()
    players = []
    case @game_number
    when 1
      @player_list.each { |x| players.append(PokerPlayer.new(x, nil)) }
      poker = Poker.new(players)
      poker.play_poker()
      puts poker.get_results()
    when 2
      @player_list.each { |x, y| players.append(ChessPlayer.new(x, y)) }
      chess = Chess.new(players)
      chess.play_game()
      puts chess.get_results()
    when 3
      @player_list.each { |x, y| players.append(GoPlayer.new(x, y)) }
      go = Go.new(players)
      go.play()
      puts go.get_results()
    end
  end
end

pg = PlayGames.new(1, ["alice", "bob", "chris", "dave"])
pg.play()

puts

pg = PlayGames.new(2, [["alice", "white"], ["bob", "black"]])
pg.play()

puts

pg = PlayGames.new(3, [["alice", "white"], ["bob", "black"]])
pg.play()

