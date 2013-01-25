class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  game.each do |player|
    raise NoSuchStrategyError unless player[1] =~ /[PRS]/i
  end

  game.map(&:last).join =~ /p[pr]|r[rs]|s[ps]/i ? game[0] : game[1]
end

def rps_tournament_winner(tournament)
  t = tournament.flatten.each_slice(2)
  t = t.each_slice(2).map { |game| rps_game_winner game } while t.count > 1
  t.flatten
end
