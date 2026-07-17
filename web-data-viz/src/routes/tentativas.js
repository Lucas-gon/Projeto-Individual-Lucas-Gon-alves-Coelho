var express = require("express");
var router = express.Router();
var tentativaController = require("../controllers/tentativaController");

router.post("/cadastrar", function (req, res) {
    tentativaController.cadastrar(req, res);
});

router.get("/alimentar_dashboard/:id_usuario", function (req, res) {
    tentativaController.alimentar_dashboard(req, res);
});

router.get("/alimentar_dashboard_evolucao/:id_usuario", function (req, res) {
    tentativaController.alimentar_dashboard_evolucao(req, res);
});

module.exports = router;