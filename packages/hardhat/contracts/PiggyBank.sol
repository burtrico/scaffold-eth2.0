pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract PiggyBank {

  address public owner;
  address[] public userIndex;
  uint count = userIndex.length;
  
  event Deposit(address sender, uint256 amount);



  // number = uint, string = bytes32
  struct Balance {
    uint256 balance;
  }

  mapping (address => Balance) public balances;

  constructor() payable {
    owner = msg.sender;
  }

  modifier onlyOwner {
    if ( msg.sender != owner) {
        revert("Only owner can call this function.");
    } else {
        _;
    }
  }

  function deposit(uint256 amount) 
    public payable returns(bool success) {
      // Need to convert to gwei?
        if(balances[owner] == 0 && amount > 0) studentIndex.push(owner);
        balances[owner].balance = balances[owner] + amount;


        return true;
  }

  function checkBalance(address user)
    public view returns(uint256 balance) {
      return( students[user].balance; )
    }


    function setPurpose(string memory newPurpose) public {
        purpose = newPurpose;
        console.log(msg.sender,"set purpose to",purpose);
        emit SetPurpose(msg.sender, purpose);
    }

    // to support receiving ETH by default
    receive() external payable {}
    fallback() external payable {}
  }
