var database = require("../database/config");

function buscar_dados() {
    var instrucaoSql = `
        SELECT 
        id_jogador, 
        nome, 
        posicao, 
        time_atual, 
        altura, 
        game_winners_convertidos, 
        game_winners_perdidos, 
        frase_motivacional 
    FROM jogadores;
`;
    console.log("Executando no Model: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscar_dados
};