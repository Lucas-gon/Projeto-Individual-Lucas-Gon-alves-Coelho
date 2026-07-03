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

CREATE TABLE conquistas (
    id_conquista INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL UNIQUE,
    requisito_acertos INT
);

CREATE TABLE usuario_conquistas (
    fk_usuario INT,
    fk_conquista INT,
    data_conclusao DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (fk_usuario, fk_conquista) 
);