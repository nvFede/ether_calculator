pragma solidity ^0.5.1;

contract Calculadora {
    //Atributos
    address private _user;
    mapping(address => int256) private _memPerUser;

    //Constructor
    function Constructor() public {
        _user = msg.sender;
        _memPerUser[_user] = 0;
    }

    //Funciones
    function suma(int256 a, int256 b) public pure returns (int256) {
        return a + b;
    }

    function sumaMemoria(int256 a) public view returns (int256) {
        return a + _memPerUser[_user];
    }

    function resta(int256 a, int256 b) public pure returns (int256) {
        return a - b;
    }

    function restaMemoria(int256 a) public view returns (int256) {
        return a - _memPerUser[_user];
    }

    event memoriaAlmacenada(int256 indexed mem);

    function almacenaMemoria(int256 resultado) public returns (int256) {
        _memPerUser[_user] = resultado;
        emit memoriaAlmacenada(_memPerUser[_user]);
        return resultado;
    }

    function obtenerMemoria() public view returns (int256) {
        return _memPerUser[_user];
    }

    event memoriaBorrada();

    function borrarMemoria() public {
        _memPerUser[_user] = 0;
    }

    function multiplica(int256 a, int256 b) public pure returns (int256) {
        return a * b;
    }

    function multiplicaMemoria(int256 a) public view returns (int256) {
        return a * _memPerUser[_user];
    }

    function divide(int256 a, int256 b) public pure returns (int256) {
        require(b != 0, "No se puede dividir por cero.");
        int256 result = a / b;
        return result;
    }

    event divisionPorCero(address _user, int256 a);

    function divideMemoria(int256 a) public payable returns (int256) {
        if (_memPerUser[_user] == 0) {
            emit divisionPorCero(_user, a);
        } else {
            return a / _memPerUser[_user];
        }
    }

    function factorial(int256 a) public pure returns (int256) {
        require(a >= 0, "El número debe ser mayor que cero.");
        int256 fac = 1;
        for (int256 i = 1; i <= a; i++) {
            fac = fac * i;
        }
        return fac;
    }
}
