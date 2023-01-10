pragma solidity ^0.4.24;

contract Factory {
    address[] public newContracts;

    function createContract(string name) public {
        address newContract = new Contract2(name); // news -> create a contract
        newContracts.push(newContract);
    } 
}

contract Contract2 {
    string public Name;
    constructor (string _name) public {
        Name = _name;
    }
    function setName(string _name) public {
        Name = _name;
    }
}

contract interaction {
    // ContractName(address) -> interact with an existed contract
    // input the address of contract2 and initialize it -> then the initialized instance can be manipulated
    Contract2 contract_ = Contract2(0x31b314e0344b86B3BB303997bE5DF99ad1a41ac5); 
    function setSomething(string _name) public {
        contract_.setName(_name);
    }
}