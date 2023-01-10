pragma solidity ^0.4.24;
import "./SafeMath.sol";
contract class31{
    using SafeMath for uint;
    function use_add(uint a,uint b) public pure returns(uint){
        return a.add(b);
    }

    function use_sub(uint a, uint b) public pure returns(uint){
        return a.sub(b);
    }

    function use_mul(uint a, uint b) public pure returns(uint){
        return a.mul(b);
    }

    function use_div(uint a, uint b) public pure returns(uint){
        return a.div(b);
    }

    function use_mod(uint a, uint b) public pure returns(uint){
        return a.mod(b);
    }

}
