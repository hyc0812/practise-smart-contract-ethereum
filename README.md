# practise-smart-contract-ethereum
This is a repo for me to practise my Solidity skills.

## Mapping with Struct

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract StudentRegistrationBook {

    struct Student {
        string name;
        uint256 age;
        string program;
        bool isCompleted;
    }

    mapping (address => Student) public students;

    function setStudent(address _addr, string memory _name, uint256 _age, string memory _program, bool _isCompleted) public {
        students[_addr] = Student(_name, _age, _program, _isCompleted);
    }

    function getStudentName (address _addr) public view returns (string memory) {
        return students[_addr].name;
    }

    function updateStudentAge (address _addr, uint256 _age) public {
        students[_addr].age = _age;
    }
        
}

```

## First smart contract practice

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// This is the contract to hash strings using keccak256
contract YongHashingString {
    // declare state varible
    bytes32 private yongString;
    // hashing the string
    function hashing (string memory _str) public {
        yongString = keccak256(bytes(_str));
    }
    //get the digest of the hasing process
    function getDigest () public view returns (bytes32) {
        return yongString;
    }    
}

```
