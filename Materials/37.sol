pragma solidity ^0.4.24;

// Interface can't have constructor. 
// can't inherit from other contracts or interface. 
// can't have variabls and parameters.
// can't have structs, enum
// all functions must be implemented.
interface class37_Interface {
     function set(uint x)external;
     function get()external returns(uint);
    //  uint public abc;
}

// is + the name of interface/contract = Interface!!
contract class37 is class37_Interface{
    uint t = 0;
    
    function set(uint x)public{
        t = x;
    }

    function get()public view returns(uint){
        return t;
    }

    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;

    function setGoStraight() public {
        choice = ActionChoices.GoStraight;
    }
    function setGoStraight2(uint x) public {
        choice = ActionChoices(x);
    }
    function getChoice() public view returns (ActionChoices) {
        return choice;
    }
}