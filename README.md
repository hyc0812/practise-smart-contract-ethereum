# practise-smart-contract-ethereum
This is a repo for me to practise my Solidity skills.

## Nested Mapping Practice
This is a practice mapping from address to string and to boolean

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract NestedMappingPractice {

    // Declare a state variable as nested mapping datatype
    mapping (address => mapping (string => bool)) private attendanceSheet;

    // Declare a funciton to set values for a student
    function setAttendance (address _addr, string memory _name, bool _isPresent) public {
        attendanceSheet[_addr][_name] = _isPresent;
    }

    // Declare a function to get the value for a student
    function getAttendance (address _addr, string memory _name) public view returns (bool) {
        return attendanceSheet[_addr][_name];
    }

    // Declare a function to toggle the value for a student
    function toggleAttendance (address _addr, string memory _name) public {
        attendanceSheet[_addr][_name] = !attendanceSheet[_addr][_name];
    }
}

```



## Mapping Practice
This is a practice mapping from address to string

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MappingPractice {

    // Declare a state variable to save the value
    mapping (address => string) private students;

    // Declare a function to set value for a student
    function setStudent (address _addr, string memory _name) public {
        students[_addr] = _name;
    }

    // Declare a function to show/get the value from state varialbe
    function getStudent (address _addr) public view returns (string memory) {
        return students[_addr];
    }

    // Declare a function to remove the student
    function removeStudent (address _addr) public {
        delete students[_addr];
    }
}

```




## Nested Mapping Practice

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PractisingNestedMapping {

    // Declare a state variable containing value with nested mapping
    mapping (address => mapping (string => bool)) private attendanceSheet;

    // Declare a function to set the value for the state variable
    function setAttendance (address _addr, string memory _name, bool _isPresent) public {
        attendanceSheet[_addr][_name] = _isPresent;
    }

    // Declare a function to get the value of the state variable
    function getAttendance (address _addr, string memory _name) public view returns (bool) {
        return attendanceSheet[_addr][_name];
    }

    // Declare a function to toggle the value of isPresent
    function toggleIsPresent (address _addr, string memory _name) public {
        attendanceSheet[_addr][_name] = !attendanceSheet[_addr][_name];
    }

}

```



## Mapping Practice

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PractisingMapping {

    // declare a State Variable mapping from address to string
    mapping(address => string) private names;

    // declare a set function to set the value for the state variable
    function setName (address _addr, string memory _name) public {
        names[_addr] = _name;
    }

    // Declare a get function to get the value from the state variable
    function getName (address _addr) public view returns (string memory) {
        return names[_addr];
    }

    // Declare a function to remove the currently defined value
    function removeName (address _addr) public {
        delete names[_addr];
    }

}

```




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
