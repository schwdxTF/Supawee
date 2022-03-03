// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract ProofOfStudent {  

  mapping (bytes32 => bool) private listStudent;

  // store the proof for a student in the contract state
  function recordProof(bytes32 proof) private {
    listStudent[proof] = true;
  }
  
  // record a student name
  function lagoon() public payable {
    require(msg.value == 0.001 ether);
    //recordProof(hashing(name));
  }

  function ocean() public payable {
    require(msg.value == 0.002 ether);
    //recordProof(hashing(name));
  }

  function beach() public payable {
    require(msg.value == 0.003 ether);
    //recordProof(hashing(name));
  }

  function pool() public payable {
    require(msg.value == 0.004 ether);
    //recordProof(hashing(name));
  }
  function reef() public payable {
    require(msg.value == 0.005 ether);
    //recordProof(hashing(name));
  }

  function grand() public payable {
    require(msg.value == 0.006 ether);
    //recordProof(hashing(name));
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }
  
  // check name of student in this class
  function checkName(string memory name) public 
  view returns (bool) {
    return listStudent[hashing(name)];
  }
}
