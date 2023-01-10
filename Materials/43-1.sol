pragma solidity ^0.4.18;

contract Token {
  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    // if _value is greater than balances[msg.sender], overflow happends!
    require(balances[msg.sender] - _value >= 0);
    // require(balances[msg.sender] >= _value ); //治標方法
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public constant returns (uint balance) {
    return balances[_owner];
  }
}