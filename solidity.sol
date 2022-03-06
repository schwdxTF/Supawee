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

  event ReserveError(
    address from,
    string text,
    string reason
  );


  struct ReserveStore{
    string name;
    string reserver;
    string timestamp;
  }
  ReserveStore[] reserve_store;
  

  function getReserve() public view returns(ReserveStore[] memory){
    return reserve_store;
  }


  // store the proof for a student in the contract state
  function recordProof(bytes32 proof) private {
    listRoom[proof] = true;
  }
  

    // record a reservation
  function lagoon(string memory name,string memory reserver,string memory timestamp) public payable {
    //require(msg.value == 0.001 ether);
    if(keccak256(bytes(name)) != keccak256(bytes("lagoon"))) {
        //---fire the event---
        emit ReserveError(msg.sender, name, "Lagoon not found. Please contact admin.");
        //---exit the function---
        return;
    }
    else if (msg.value != 0.001 ether) {
        //---fire the event---
        emit ReserveError(msg.sender, name, "Lagoon require 0.001 Ether. Please repay.");
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        //---exit the function---
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
    
  }

  function ocean(string memory name,string memory reserver,string memory timestamp) public payable {
    //require(msg.value == 0.002 ether);
    if(keccak256(bytes(name)) != keccak256(bytes("ocean"))) {
        emit ReserveError(msg.sender, name, "Ocean not found. Please contact admin.");
        return;
    }
    else if (msg.value != 0.002 ether) {
        emit ReserveError(msg.sender, name, "Ocean require 0.002 Ether. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
    
  }

  function beach(string memory name,string memory reserver,string memory timestamp) public payable {
    //require(msg.value == 0.003 ether);
    if(keccak256(bytes(name)) != keccak256(bytes("beach"))) {
        emit ReserveError(msg.sender, name, "Beach not found. Please contact admin.");
        return;
    }
    else if (msg.value != 0.003 ether) {
        emit ReserveError(msg.sender, name, "Beach require 0.003 Ether. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
    
  }

  function pool(string memory name,string memory reserver,string memory timestamp) public payable {
    //require(msg.value == 0.004 ether);
    if(keccak256(bytes(name)) != keccak256(bytes("pool"))) {
        emit ReserveError(msg.sender, name, "Pool not found. Please contact admin.");
        return;
    }
    else if (msg.value != 0.004 ether) {
        emit ReserveError(msg.sender, name, "Pool require 0.003 Ether. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
    
  }
  function reef(string memory name,string memory reserver,string memory timestamp) public payable {
    //require(msg.value == 0.005 ether);
    if(keccak256(bytes(name)) != keccak256(bytes("reef"))) {
        emit ReserveError(msg.sender, name, "Reef not found. Please contact admin.");
        return;
    }
    else if (msg.value != 0.004 ether) {
        emit ReserveError(msg.sender, name, "Reef require 0.005 Ether. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
    
  }

  function grand(string memory name,string memory reserver,string memory timestamp) public payable {
    //require(msg.value == 0.006 ether);
    if(keccak256(bytes(name)) != keccak256(bytes("grand"))) {
        emit ReserveError(msg.sender, name, "Grand not found. Please contact admin.");
        return;
    }
    else if (msg.value != 0.006 ether) {
        emit ReserveError(msg.sender, name, "Grand require 0.005 Ether. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }

    reserve_store.push(ReserveStore(name,reserver,timestamp));
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
