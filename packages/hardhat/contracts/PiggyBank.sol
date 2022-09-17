pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract PiggyBank {

  address payable public owner;

  uint public transactions;

  struct Balance {
    uint256 balance;
  }

  struct UserDetails {
    string calldata name;
    uint256 age;
  }

  mapping (address => Balance) public balances;
  mapping (address => UserDetails) public usersDetails;

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
      balances[owner] += amount;
      transactions++;

      return true;
  }

  function checkBalance(address user)
    public view returns(uint256 balance) {
      return balances[owner];
    }

  function setUserDetails(string calldata name, uint256 age)
    public returns(bool success) {
      usersDetails[owner].name = name;
      usersDetails[owner].age = age;

      return true;
  }

  function getUserDetail(address user)
    public view returns(uint256 balance) {
    return( 
      userDetails[user].name; 
      userDetails[user].age;
    )
  }

    receive() external payable {}
    fallback() external payable {}
  }
