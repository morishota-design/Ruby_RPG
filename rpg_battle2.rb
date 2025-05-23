class Character
  attr_accessor :name, :hp, :attack_damage, :attack_type, :is_player, :is_alive

  def initialize(name, hp, attack_damage, attack_type, is_player = false)
    @name = name
    @hp = hp
    @attack_damage = attack_damage
    @attack_type = attack_type
    @is_player = is_player
    @is_alive = true
  end
end

class Game
  def initialize
    puts "↓勇者の名前を入力してください↓"
    hero_name = gets.chomp

    @heroes = create_heroes(hero_name)
    @monsters = create_monsters

    display_character_info(@heroes)
    display_character_info(@monsters)
  end

  def execute_attack(attacker, defender)  # (行動するキャラクター, こうげき対象)
    # こうげきメッセージ(タイプ別)
    case attacker.attack_type
    when Constants::ATTACK_TYPE_NORMAL
        puts "#{attacker.name}のこうげき！"
    when Constants::ATTACK_TYPE_MAGIC
        puts "#{attacker.name}の魔法こうげき！"
    end

    # ダメージ処理
    damage = attacker.calculate_damage()  # ダメージ計算
    defender.receive_damage(damage)       # ダメージ反映

    puts "#{defender.name} に #{damage} のダメージ！"  # ダメージ処理
  end

  # ゲーム進行
    def start
    # 略

    # ステータス表示
    display_status(@heroes)    # 勇者パーティ表示
    display_status(@monsters)  # モンスターパーティ表示

    # 略
    end

    # ステータス表示
    def display_status(character)
    puts "・【#{character.name}】 HP：#{character.hp} こうげき力：#{character.attack_damage}"
    end

  private

  def create_heroes(hero_name)
    [Character.new(hero_name, 30, 6, "普通", true)]
  end

  def create_monsters
    [Character.new('オーク', 30, 8, "普通")]
  end

  def display_character_info(characters)
    characters.each do |character|
      puts "\nキャラクター名：#{character.name}"
      puts "HP：#{character.hp}"
      puts "こうげき力：#{character.attack_damage}"
      puts "こうげきタイプ：#{character.attack_type}"
      puts "プレイヤーフラグ：#{character.is_player}"
      puts "生存フラグ：#{character.is_alive}"
    end
  end
end

game = Game.new
game.start
