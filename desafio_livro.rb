def da_boas_vindas
  puts "Bem vindo ao jogo de Adivinhação!"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome 
end

def pede_dificuldade
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end 
  puts "Escolhendo um número secreto entre 0 e #{maximo}..."
  sorteado = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
  sorteado
end 

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
  puts "\n\n\n\n"
  puts "Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s
  puts "Chutes até agora: " + chutes.to_s
  puts "Entre com o número"
  chute = gets.strip
  puts "Será que acertou? Você chutou " + chute
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute
  if acertou
    puts "Acertou!"
  return true
    else
    maior = numero_secreto > chute
    if maior
      puts "O número secreto é maior!"
    else
      puts "O número secreto é menor!"
    end
  end
end

def pede_dificuldade
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  dificuldade = gets.to_i
end

nome = da_boas_vindas
dificuldade = pede_dificuldade
numero_secreto = sorteia_numero_secreto dificuldade
limite_de_tentativas = 5
chutes = []
pontos_ate_agora = 1000

for tentativa in 1..limite_de_tentativas
  chute = pede_um_numero chutes, tentativa, limite_de_tentativas
  chutes << chute
  pontos_a_perder = (chute - numero_secreto).abs / 2.0
  pontos_ate_agora = pontos_ate_agora - pontos_a_perder
  if verifica_se_acertou numero_secreto, chute
    break
  end
end

diferença = 1
ultimo_chute = 1
ultima_tentativa = 6

for tentativa in 5..limite_de_tentativas
  ultimo_chute = numero_secreto == chute - diferença
  acertou_ultimo_chute = numero_secreto == chute 
  if ultimo_chute
    p "Você passou raspando! Por isso vou te dar mais uma chance!"
  chute = pede_um_numero chutes, ultimo_chute, ultima_tentativa
  chutes << chute
  if acertou_ultimo_chute
    p "Parabéns!!! você acertou!!!"
  end
  if verifica_se_acertou numero_secreto, chute
  break
  end
  else
    p "Não foi dessa vez...mas na próxima você consegue!"
  end
end

def nao_quer_jogar
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quero_jogar = quero_jogar.upcase == "N"
end

nao_quer_jogar
nome = da_boas_vindas
dificuldade = pede_dificuldade

