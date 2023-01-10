pragma solidity ^0.4.25;
// import "github.com/oraclize/ethereum-api/oraclizeAPI_0.4.sol";
// import "github.com/provable-things/ethereum-api/provableAPI.sol";
import "github.com/provable-things/ethereum-api/blob/master/contracts/solc-v0.4.25/oraclizeAPI.sol";

contract SimpleOraclizeContract is usingOraclize {

    string public BTCUSDT;
    
    event LogConstructorInitiated(string nextStep);
    event LogPriceUpdated(string price);
    event LogNewOraclizeQuery(string description);

    constructor()public payable {
       emit LogConstructorInitiated("Constructor was initiated. Call 'updatePrice()' to send the Oraclize Query.");
    }

    function __callback(bytes32 myid, string result) public {
        if (msg.sender != oraclize_cbAddress()) revert(); // To ensure only Oraclize allowed to call the function
        BTCUSDT = result;
        emit LogPriceUpdated(result);
    }

    //Delpoy contract -> Oraclize -> API Binance -> BTCUSDT
    //Request for updating BTC price (updatePrice) -> Oraclize return price (__callback)

    //要有足夠的手續費給oraclize
    function updatePrice()public payable {
        if (oraclize_getPrice("URL") > address(this).balance) {
            emit LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            emit LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            oraclize_query("URL", "json(https://api.binance.com/api/v3/avgPrice?symbol=BTCUSDT).price");
        }
    }
}