// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaSierraLeona
 * @dev Registro de tecnicas de emulsion de clorofila y estabilidad de lipidos.
 * Serie: Sabores de Africa (45/54)
 */
contract CulturaSierraLeona {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 solubilidadHoja;     // Nivel de integracion de la hoja picada (1-100)
        uint256 purezaAceitePalma;   // Grado de extraccion virgen (1-10)
        bool usaPescadoAhumado;      // Factor de profundidad de sabor
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Potato Greens (Ingenieria de la Hoja)
        registrarPlato(
            "Potato Greens", 
            "Hojas de patata finamente picadas, aceite de palma virgen, pescado ahumado, arroz.",
            "Picado extremo de las hojas para liberar jugos celulares; coccion en aceite de palma hasta lograr una emulsion verde intensa.",
            96, 
            9, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _solubilidad, 
        uint256 _pureza,
        bool _ahumado
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_solubilidad <= 100, "Escala de solubilidad excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            solubilidadHoja: _solubilidad,
            purezaAceitePalma: _pureza,
            usaPescadoAhumado: _ahumado,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
