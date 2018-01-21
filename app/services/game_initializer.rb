class GameInitializer
  GAME_SIZE = 25
  attr_reader :game, :cards, :identities

  def initialize(game)
    @game = game
    @identities = init_identities
    @cards = pick_cards
  end

  def init_identities
    first_team = [:red_spy, :blue_spy].sample
    game.update(turn: first_team.to_s.split('_').first)
    positions = (0...GAME_SIZE).to_a
    identities = {}

    assign_positions(:blue_spy, 8, positions, identities)
    assign_positions(:red_spy, 8, positions, identities)
    assign_positions(first_team, 1, positions, identities)
    assign_positions(:assassin, 1, positions, identities)
  end

  def pick_cards
    Card.all.sample(GAME_SIZE).each_with_index do |card, index|
      GameCard.create({
        game_id: game.id,
        card_id: card.id,
        index: index,
        identity: identities[index] || :innocent_bystander
      })
    end
  end

  private

  def assign_positions(identity, quantity, positions, identity_map)
    ids = destructive_sample(positions, quantity)
    ids.each { |id| identity_map[id] = identity}
    identity_map
  end

  def destructive_sample(arr, amt = 1)
    chosen = arr.sample(amt)
    chosen.each { |el| arr.delete(el) }
  end

end
