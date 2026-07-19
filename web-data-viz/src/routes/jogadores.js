var express = require("express");
var router = express.Router();
var tentativaController = require("../controllers/jogadoresController");

router.get("/buscar", function (req, res) {
    tentativaController.buscar_dados(req, res);
});

module.exports = router;