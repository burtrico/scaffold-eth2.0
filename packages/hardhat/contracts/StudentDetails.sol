pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

// error AlreadyRegistered(uint256 studentID);

contract StudentDetails {

  address public owner;
  address[] public studentIndex;

  uint count = studentIndex.length;

  // number = uint, string = bytes32
  struct Student {
    uint percentage;
    uint totalMarks;
  }

  mapping (address => Student) public students;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner {
    if ( msg.sender != owner) {
        revert("Only owner can call this function.");
    } else {
        _;
    }
  }

  function register(
    address studentID,
    uint percentage_,
    uint totalMarks_
    ) public returns(bool success) {
        students[studentID].percentage = percentage_;
        students[studentID].totalMarks = totalMarks_;

        studentIndex.push(studentID);
        return true;
  }

  function getStudentDetails(address studentID)
    public view returns(uint percentage, 
    uint totalMarks) {
      return(
        students[studentID].percentage,
        students[studentID].totalMarks);
    }
  }
