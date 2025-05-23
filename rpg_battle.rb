class Character
  # ステータスを管理するアクセサ
  attr_accessor :name, :hp, :attack_damage, :attack_type, :is_player, :is_alive

  # キャラクターの初期設定
  def initialize(name, hp, attack_damage, attack_type, is_player = false)
    @name = name                    # キャラクター名
    @hp = hp                        # HP
    @attack_damage = attack_damage  # こうげき力
    @attack_type = attack_type      # こうげきタイプ
    @is_player = is_player          # プレイヤーフラグ
    @is_alive = true                # 生存フラグ
  end
end

class Game
  # ゲームの初期設定を行う
  def initialize
    puts "↓勇者の名前を入力してください↓"
    hero_name = gets.chomp  # ユーザの入力を取得

    # キャラクターの作成
    @heroes = create_heroes(hero_name)
    @monsters = create_monsters

    # キャラクター情報を表示
    display_character_info(@heroes)
    display_character_info(@monsters)
  end

  private

  # 勇者パーティを作成
  def create_heroes(hero_name)
    [Character.new(hero_name, 30, 6, "普通", true)]  # プレイヤー操作の勇者（配列で返す）
  end

  # モンスターを作成
  def create_monsters
    [Character.new('オーク', 30, 8, "普通")]  # オーク（CPU）を配列で返す
  end

  # キャラクター情報を表示するメソッド
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

# ゲームを開始
Game.new
