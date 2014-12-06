require 'pry'

class Deck
  attr_reader :deck, :in_play

  def initialize
    generate_deck
  end

  def generate_deck
    card_hash = {
      'A♠' => 1,
      'A♥' => 1,
      'A♦' => 1,
      'A♣' => 1,
      '2♠' => 2,
      '2♥' => 2,
      '2♦' => 2,
      '2♣' => 2,
      '3♠' => 3,
      '3♥' => 3,
      '3♦' => 3,
      '3♣' => 3,
      '4♠' => 4,
      '4♥' => 4,
      '4♦' => 4,
      '4♣' => 4,
      '5♠' => 5,
      '5♥' => 5,
      '5♦' => 5,
      '5♣' => 5,
      '6♠' => 6,
      '6♥' => 6,
      '6♦' => 6,
      '6♣' => 6,
      '7♠' => 7,
      '7♥' => 7,
      '7♦' => 7,
      '7♣' => 7,
      '8♠' => 8,
      '8♥' => 8,
      '8♦' => 8,
      '8♣' => 8,
      '9♠' => 9,
      '9♥' => 9,
      '9♦' => 9,
      '9♣' => 9,
      '10♠' => 10,
      '10♥' => 10,
      '10♦' => 10,
      '10♣' => 10,
      'J♠' => 10,
      'J♥' => 10,
      'J♦' => 10,
      'J♣' => 10,
      'Q♠' => 10,
      'Q♥' => 10,
      'Q♦' => 10,
      'Q♣' => 10,
      'K♠' => 10,
      'K♥' => 10,
      'K♦' => 10,
      'K♣' => 10
    }

    @deck = []

    card_hash.each do |card, value|
      deck << Card.new(card, value)
    end

    @deck.shuffle!
  end
end

class Card
  attr_reader :name, :value

  def initialize(name, value)
    @name = name
    @value = value
  end

  def ace_change_value
    @value += 10
  end

end

class Hand
  attr_reader :hand_array

  def initialize(play_deck, player_name)
    @player_name = player_name
    @hand_array = []
    @play_deck = play_deck
    2.times { draw_card(@player_name) }
  end

  def draw_card(player_name)
    @card = @play_deck.deck.pop
    if player_name == "You"
      puts "#{player_name} were dealt #{@card.name}"
      if @card.name.split("").include?("A")
        puts "Ace as 1 or 11? (Y/N):"
        player_choice = gets.chomp.downcase

        if player_choice == "y"
          @card.ace_change_value
        end
      end
    end
    @hand_array << @card
  end

  def card_total
    total = 0
    @hand_array.each do |card|
      total += card.value
    end
    total
  end
end

def play_game
  player_wins = false
  computer_wins = false
  stand = false

  puts "Welcome to Blackjack!\n\n"
  new_deck = Deck.new

  player_hand = Hand.new(new_deck, "You")
  dealer_hand = Hand.new(new_deck, "Dealer")

  until player_wins == true || computer_wins == true || stand == true
    player_total = player_hand.card_total
    dealer_total = dealer_hand.card_total

<<<<<<< HEAD
    ####### ace choice for 11 or 1 value ##########################

    def ace
      if player_total || dealer_total <= 10
        generate_deck['A♠'] || generate_deck['A♥'] || generate_deck['A♦'] || generate_deck['A♣'] = 11
      else
        generate_deck['A♠'] || generate_deck['A♥'] || generate_deck['A♦'] || generate_deck['A♣'] = 1
      end
      ace
    end

    ############## conditionals for winning game ####################
=======
>>>>>>> a26f0b235262c3c20ca61a72fde5f9c0ddf70884
    if player_total >= 22
      computer_wins = true
      puts "Bust: total is #{player_total}, house wins"
    else
<<<<<<< HEAD
      puts "Prayer score: #{player_total}"
      puts "Dealer score: #{dealer_total}"
      print "Hit or stand (H/S): "

      ########## added the invalid entry portion ###################
=======
      puts "Your card total is: #{player_total}"
      puts "Hit or stand? (H/S):"
>>>>>>> a26f0b235262c3c20ca61a72fde5f9c0ddf70884

      player_choice = gets.chomp.downcase

      if player_choice == "h"
        player_hand.draw_card("You")
<<<<<<< HEAD
      end

      ############ dealers choice ####################################
=======
>>>>>>> a26f0b235262c3c20ca61a72fde5f9c0ddf70884

      elsif player_choice == "s"

        if dealer_total >= 22
          player_wins = true
          puts "Dealer bust: player wins!"
        elsif dealer_total <= 17
          dealer_hand.draw_card("Dealer")
        else
<<<<<<< HEAD
          dealer_choice == "s"
=======
          puts "Dealer stays."
          stand = true
>>>>>>> a26f0b235262c3c20ca61a72fde5f9c0ddf70884
        end
      end
    end

  end

  puts "Player total is #{player_total}"
  puts "Dealer total is #{dealer_total}\n\n\n"

  if (21 - player_total) < (21 - dealer_total) && player_wins != false
    puts "Player wins!"
  elsif (21 - dealer_total) < (21 - player_total)
    puts "Computer wins!"
  else
    puts "EVERYBODY WINS!!!!!!!!!"
  end
end

play_game
