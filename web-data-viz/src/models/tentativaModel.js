var database = require("../database/config");

function cadastrar(descricao, resultado, id_usuario) {
    var instrucaoSql = `
        INSERT INTO tentativa (descricao, resultado, fk_usuario)
        VALUES ('${descricao}', '${resultado}', ${id_usuario} )
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function alimentar_dashboard(id_usuario) {
    var instrucaoSql = `
        SELECT fg_porcentagem, total_arremessos, total_acertos, total_erros 
        FROM vw_dashboard 
        WHERE fk_usuario = ${id_usuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
};

function alimentar_dashboard_evolucao(id_usuario) {
    var instrucaoSql = `
        SELECT resultado, id_tentativa
        FROM tentativa
        WHERE fk_usuario = ${id_usuario}
        ORDER BY id_tentativa DESC LIMIT 7;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrar, 
    alimentar_dashboard,
    alimentar_dashboard_evolucao
};