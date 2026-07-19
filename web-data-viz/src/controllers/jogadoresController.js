var jogadoresModel = require("../models/jogadoresModel"); 

function buscar_dados(req, res) {
    console.log("Vou buscar dados dos jogadores");

    jogadoresModel.buscar_dados()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado); 
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        }).catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    buscar_dados
}