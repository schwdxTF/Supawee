// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract b6210236_b6238124 {  

  mapping (bytes32 => bool) private listRoom;

  //---events-----
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
  function poly(string memory name,string memory reserver,string memory timestamp) public payable {
    //require(msg.value == 0.001 ether);
    if(keccak256(bytes(name)) != keccak256(bytes("poly"))) {
        //---fire the event---
        emit ReserveError(msg.sender, name, "Polynesian not found. Please contact admin.");
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        //---exit the function---
        return;
    }
    else if (msg.value != 0.001 ether) {
        //---fire the event---
        emit ReserveError(msg.sender, name, "Polynesian require 0.001 ETH. Please repay.");
        //---refund back to the sender---
        payable(msg.sender).transfer(msg.value);
        //---exit the function---
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, "Polynesian",hashing(name),reserver,timestamp);
    
  }

  function space(string memory name,string memory reserver,string memory timestamp) public payable {
    if(keccak256(bytes(name)) != keccak256(bytes("space"))) {
        emit ReserveError(msg.sender, name, "Space not found. Please contact admin.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    else if (msg.value != 0.002 ether) {
        emit ReserveError(msg.sender, name, "Space require 0.002 ETH. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, "Space",hashing(name),reserver,timestamp);
    
  }

  function roman(string memory name,string memory reserver,string memory timestamp) public payable {
    if(keccak256(bytes(name)) != keccak256(bytes("roman"))) {
        emit ReserveError(msg.sender, name, "Roman not found. Please contact admin.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    else if (msg.value != 0.003 ether) {
        emit ReserveError(msg.sender, name, "Roman require 0.003 ETH. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, "Roman",hashing(name),reserver,timestamp);
    
  }

  function vict(string memory name,string memory reserver,string memory timestamp) public payable {
    if(keccak256(bytes(name)) != keccak256(bytes("vict"))) {
        emit ReserveError(msg.sender, name, "Victorain Coach not found. Please contact admin.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    else if (msg.value != 0.004 ether) {
        emit ReserveError(msg.sender, "Victorain Coach", "Victorain Coach require 0.004 ETH. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, name,hashing(name),reserver,timestamp);
    
  }
  function truck(string memory name,string memory reserver,string memory timestamp) public payable {
    if(keccak256(bytes(name)) != keccak256(bytes("truck"))) {
        emit ReserveError(msg.sender, name, "Luxury Truck not found. Please contact admin.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    else if (msg.value != 0.005 ether) {
        emit ReserveError(msg.sender, name, "Luxury Truck require 0.005 ETH. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, "Luxury Truck",hashing(name),reserver,timestamp);
    
  }

  function prince(string memory name,string memory reserver,string memory timestamp) public payable {
    if(keccak256(bytes(name)) != keccak256(bytes("prince"))) {
        emit ReserveError(msg.sender, name, "Luxury Princess Room not found. Please contact admin.");
        payable(msg.sender).transfer(msg.value);
        return;
    }
    else if (msg.value != 0.006 ether) {
        emit ReserveError(msg.sender, name, "Luxury Princess Room require 0.006 ETH. Please repay.");
        payable(msg.sender).transfer(msg.value);
        return;
    }

    reserve_store.push(ReserveStore(name,reserver,timestamp));
    emit ReserveAdd(msg.sender, "Luxury Princess Room",hashing(name),reserver,timestamp);
    
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }
  
  // check room
  function checkRoom(string memory name) public 
  view returns (bool) {
    return listRoom[hashing(name)];
  }
}

