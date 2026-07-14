var database = require("../database/config");

function cadastrar(descricao, resultado, id_usuario) {
    var instrucaoSql = `
        INSERT INTO tentativa (descricao, resultado, fk_usuario)
        VALUES ('${descricao}', '${resultado}', ${id_usuario} )
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrar    
};