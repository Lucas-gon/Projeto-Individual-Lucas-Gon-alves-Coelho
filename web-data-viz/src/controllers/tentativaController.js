var tentativaModel = require("../models/tentativaModel"); 
    
function cadastrar(req, res) {
    var descricao = req.body.descricao;
    var resultado = req.body.resultado;
    var id_usuario = req.body.id_usuario;
    
    if (descricao == undefined) {
        res.status(400).send("Sua descrição está undefined!")
    }
    else if (resultado == undefined) {
        res.status(400).send("Seu resultado está undefined!")
    }
    else if (id_usuario == undefined) {
        res.status(400).send("Seu ID de usuário está undefined!")
    } else {
        tentativaModel.cadastrar(descricao, resultado, id_usuario)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log( "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage)
            res.status(500).json(erro.sqlMessage);
        });
    }
};

function alimentar_dashboard(req, res) {
    var id_usuario = req.params.id_usuario;

    tentativaModel.alimentar_dashboard(id_usuario)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao alimentar o dashboard! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
};

function alimentar_dashboard_evolucao(req, res) {
    var id_usuario = req.params.id_usuario;

    tentativaModel.alimentar_dashboard_evolucao(id_usuario)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao alimentar o dashboard de evolução! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
};

module.exports = {
    cadastrar,
    alimentar_dashboard,
    alimentar_dashboard_evolucao
};