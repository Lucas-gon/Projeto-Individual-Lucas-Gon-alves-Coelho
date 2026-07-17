CREATE DATABASE projeto_individual;
USE projeto_individual;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE tentativa (
    id_tentativa INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL, 
    resultado VARCHAR(30) NOT NULL CHECK (resultado IN('Acertou', 'Errou')), 
    data_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_usuario INT,
		CONSTRAINT fk_usuario_tentativa FOREIGN KEY (fk_usuario)
			REFERENCES usuario(id_usuario)
);

CREATE TABLE jogadores (
    id_jogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    posicao VARCHAR(50) NOT NULL,
    time_atual VARCHAR(50) NOT NULL,
    altura DECIMAL(3,2) NOT NULL, 
    game_winners_convertidos INT NOT NULL, 
    game_winners_perdidos INT NOT NULL
);

INSERT INTO game_winner.jogadores 
(nome, posicao, time_atual, altura, game_winners_convertidos, game_winners_perdidos, frase_motivacional) VALUES
('Stephen Curry', 'Armador', 'Warriors', 1.88, 10, 22, 'Seja a melhor versão de si mesmo em qualquer coisa que fizer.'),
('LeBron James', 'Ala', 'Lakers', 2.06, 28, 45, 'Eu amo o sucesso, mas são os obstáculos que realmente me moldam.'),
('Kevin Durant', 'Ala', 'Suns', 2.11, 14, 26, 'O trabalho duro vence o talento quando o talento não trabalha duro.'),
('Giannis Antetokounmpo', 'Ala-Pivô', 'Bucks', 2.11, 6, 15, 'Seja constante, continue trabalhando e coisas boas vão acontecer.'),
('Luka Doncic', 'Armador', 'Mavericks', 2.01, 9, 20, 'Eu apenas me divirto jogando basquete, sem pressão.'),
('Shai Gilgeous-Alexander', 'Armador', 'Thunder', 1.98, 7, 13, 'Confie no processo e no trabalho diário que você coloca no escuro.'),
('Victor Wembanyama', 'Pivô', 'Spurs', 2.24, 2, 8, 'Eu quero ser eu mesmo, criar minha própria história e não ser comparado.'),
('Kobe Bryant', 'Ala-Armador', 'Lakers', 1.98, 36, 52, 'Se você não acredita em si mesmo, ninguém mais vai acreditar.'),
('Anthony Edwards', 'Ala-Armador', 'Timberwolves', 1.93, 5, 14, 'Eu entro em quadra achando que ninguém pode me parar.'),
('Derrick Rose', 'Armador', 'Bulls', 1.91, 11, 18, 'Eu sempre soube que, se trabalhasse duro o suficiente, as coisas dariam certo.'),
('Jayson Tatum', 'Ala', 'Celtics', 2.03, 11, 24, 'Eu sempre acreditei que, se você trabalhar, os resultados virão.');

CREATE TABLE conquistas (
    id_conquista INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL UNIQUE,
    requisito_acertos INT
);

CREATE TABLE usuario_conquistas (
    fk_usuario_conquista INT,
		CONSTRAINT fk_conquista_do_usuario FOREIGN KEY (fk_usuario_conquista)
			REFERENCES usuario(id_usuario),
    fk_conquista INT,
		CONSTRAINT conquista_fk FOREIGN KEY (fk_conquista)
			REFERENCES conquistas(id_conquista),
    data_conclusao DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (fk_usuario_conquista, fk_conquista) 
);

CREATE VIEW vw_dashboard AS
SELECT 
    fk_usuario,
    COUNT(id_tentativa) AS total_arremessos,
    SUM(CASE WHEN resultado = 'Acertou' THEN 1 ELSE 0 END) AS total_acertos,
    SUM(CASE WHEN resultado = 'Errou' THEN 1 ELSE 0 END) AS total_erros,
    CASE 
        WHEN COUNT(id_tentativa) > 0 
        THEN ROUND((SUM(CASE WHEN resultado = 'Acertou' THEN 1 ELSE 0 END) / COUNT(id_tentativa)) * 100, 0)
        ELSE 0 
    END AS fg_porcentagem
FROM tentativa
GROUP BY fk_usuario;

SELECT resultado, id_tentativa 
    FROM tentativa 
    WHERE fk_usuario = 1
    ORDER BY id_tentativa DESC LIMIT 7;