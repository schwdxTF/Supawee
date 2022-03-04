// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract b6210236_b6238124 {  

  mapping (bytes32 => bool) private listRoom;

  //---events---
  event ReserveAdd(
    address from,   
    string text,
    bytes32 hash,
    string reserver,
    string timestamp

  );
  
  event RegistrationError(
    address from,
    string text,
    string reason
  );

  // store the proof for a student in the contract state
  function recordProof(bytes32 proof) private {
    listRoom[proof] = true;
  }
  

    // record a reservation
  function lagoon(string memory name,string memory reserver,string memory timestamp) public payable {
    require(msg.value == 0.001 ether);
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
  }

  function ocean(string memory name,string memory reserver,string memory timestamp) public payable {
    require(msg.value == 0.002 ether);
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
  }

  function beach(string memory name,string memory reserver,string memory timestamp) public payable {
    require(msg.value == 0.003 ether);
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
  }

  function pool(string memory name,string memory reserver,string memory timestamp) public payable {
    require(msg.value == 0.004 ether);
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
  }
  function reef(string memory name,string memory reserver,string memory timestamp) public payable {
    require(msg.value == 0.005 ether);
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
  }

  function grand(string memory name,string memory reserver,string memory timestamp) public payable {
    require(msg.value == 0.006 ether);
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }
  
  // check name of student in this class
  function checkName(string memory name) public 
  view returns (bool) {
    return listRoom[hashing(name)];
  }
}
