#じゃんけん機能
def janken
  
  puts "0（グー）1（チョキ）2（パー）3(戦わない)"
  
  #入力された値を格納
  @num = gets.chomp.to_i
  
  #入力された値に合わせて手に変える
  if @num == 0
    
    @me = "グー"
    
  elsif @num == 1
    
    @me = "チョキ"  
    
  elsif @num == 2
    
    @me = "パー"   
  
  #3が入力された場合はそのまま終了
  elsif @num == 3
    puts "終了します"
    exit
    
  #0~3以外が入力された場合  
  else
    puts "0~3のいずれかを選択してください"
    #もう一度じゃんけんする（処理は後述）
  end

  if @num <= 3
    
    #0.1.2のいずれかの数字をランダムで発生させる
    #相手のじゃんけんの手札の初期値はグーにしておく
    @opponent = [rand(3),"グー"]
    
    #数字に合わせて相手の手を変える
    if @opponent[0] == 1
       
       @opponent[1] = "チョキ"
       
    elsif @opponent[0] == 2
      
       @opponent[1] = "パー"
      
    end
    
    #「1回目のじゃんけん」または「あいこのじゃんけん」に合わせて掛け声を変える
    #@number_of_times:あいこになった場合は1とする
    if @number_of_times == 1
      puts "ショ！"
    else 
      puts "ホイ！"
    end
    
    puts "--------------------------------"
    puts "あなた：#{@me}を出しました"
    puts "相手：#{@opponent[1]}を出しました"
    puts "--------------------------------"
    
    #あいこだった場合
    if @num == @opponent[0]
      
      @number_of_times = 1 
      
      puts "あいこで・・・"
      
      #もう一度じゃんけんする
      janken
      
      #一度リセットしておく（そうしないと、新しくじゃんけんを始めても掛け声が「ショ！」のままになってしまう）
      @number_of_times = 0
    end
  
  #0~3以外の数字が押下された場合
  else
    #もう一度じゃんけんする
    janken
  end  
  
  #じゃんけんの勝敗を設定
  #@victory = 1:自分が勝利
  #@victory = 2:相手が勝利
  if @me == "グー"
    
    if @opponent[1] == "チョキ"
      @victory = 1
    elsif @opponent[1] == "パー"
      @victory = 2
    end
    
  elsif @me == "チョキ"
    
    if @opponent[1] == "グー"
      @victory = 2
    elsif @opponent[1] == "パー"
      @victory = 1
    end

  elsif @me == "パー"
    
    if @opponent[1] == "グー"
      @victory = 1
    elsif @opponent[1] == "チョキ"
      @victory = 2
    end    
  
  end

end


#あっち向いてホイ機能
def look_this_way
  
  puts "0（上）1（下）2（左）3(右)"
  
  @num = gets.chomp.to_i  
  
  if @num == 0
    
    @me = "上"
    
  elsif @num == 1
    
    @me = "下"  
    
  elsif @num == 2
    
    @me = "左"   
  
  elsif @num == 3
    @me = "右"
  else
    puts "0~3のいずれかを選択してください"
    #もう一度あっち向いてホイをする（処理の記述は178行目）
  end  

  if @num <= 3

    #相手のじゃんけんの手札の初期値はグーにしておく
    @opponent = [rand(4),"上"]  
  
    #数字に合わせて手札を変える
    if @opponent[0] == 1
       
       @opponent[1] = "下"
       
    elsif @opponent[0] == 2
      
       @opponent[1] = "左"

    elsif @opponent[0] == 3
      
       @opponent[1] = "右"       
      
    end  

    puts "ホイ！"
    puts "--------------------------------"
    puts "あなた：#{@me}"
    puts "相手：#{@opponent[1]}"
    puts "--------------------------------"    
    
  end
  
  #自分がじゃんけんに勝利した状態、かつ、あっち向いてホイで方向が一致した場合
  if @victory == 1 && (@me == @opponent[1])
    puts "あなたの勝ち"
  
  #相手がじゃんけんに勝利した状態、かつ、あっち向いてホイで方向が一致した場合  
  elsif @victory == 2 && (@me == @opponent[1])
    puts "あなたの負け"
  
  #0~3以外の数字が押下された場合   
  elsif @num >= 4
    look_this_way
  
  #あっち向いてホイで勝敗がつかなかった場合、もう一度じゃんけんからやり直す   
  else
    puts "じゃんけん・・・"
    janken
    
    puts "あっち向いて〜"
    look_this_way
  end
      
end


#実行処理
puts "じゃんけん・・・"
janken

puts "あっち向いて〜"
look_this_way
