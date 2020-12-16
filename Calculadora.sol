pragma solidity ^0.5.1;

contract Calculadora {
    //Atributos
    int256 private _memoria;
    //Constructor
    function Constructor() public
    {
        _memoria = 0;
    }
    //Funciones
    function suma(int256 a, int256 b) public pure returns (int256)
    {
        return a + b;
    }
    function sumaMemoria(int256 a) public view returns (int256)
    {
        return a + _memoria;
    }
    function resta(int256 a, int256 b) public pure returns (int256)
    {
        return a - b;
    }
    function restaMemoria(int256 a) public view returns (int256)
    {
        return a - _memoria;
    }
	event memoriaAlmacenada(int256 indexed mem);
    function almacenaMemoria(int256 resultado) public returns (int256)
    {
        _memoria = resultado;
		emit memoriaAlmacenada(_memoria);
        return resultado;
    }
    function obtenerMemoria() public view returns (int256)
    {
        return _memoria;
    }
	event memoriaBorrada();
    function borrarMemoria() public
    {
        _memoria = 0;
    }
}