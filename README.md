# practise-smart-contract-ethereum
This is a repo for me to practise my Solidity skills.


## ETH Sending and Receiving

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EtherSendingPractice {

        // Payable address can send Ether via transfer or send
        address payable public owner;

        // Payable constructor can receive ether
        constructor() payable {
            owner = payable(msg.sender);
        }

        // Declare a event named Deposit
        event Deposit(address indexed sender, uint256 amount);

        // Declare a mapping from address to uint8
        mapping (address => uint256) private deposits;  

        // Declare a function to deposit Ether to this contract
        function deposit() public payable {
            deposits[msg.sender] += msg.value;
            emit Deposit(msg.sender, msg.value);
        }

        //receive() external payable {}

        // Declare a function to withdraw all ETH from contract to Owner
        function withdraw() public {
            uint256 amount = address(this).balance;
            // Send all ETH to owner
            (bool success,) = owner.call{value: amount}("");
            require(success, "Failed to send ETH");
        }

        // Declare a function to check the deposit amount from any depositer
        function checkDepositAmount(address _addr) public view returns (uint256) {
            return deposits[_addr];
        }
}

```









## Mapping from address to struct with msg.sender and modifier

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract StudentRegisterSystem {

    // Declare a struct for student structure
    struct Student {
        string name;
        string id;
        string programRegistered;
        bool isRegistered;
    }

    // Check the caller is the owner
    modifier onlyOwner(){
        require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "not owner");
        _;
    }

    // Check the caller is the registered students
    modifier onlyRegisteredStudents () {
        require(students[msg.sender].isRegistered == true, "only Registered Students");
        _;
    }

    // Declare a state variable mapping from address to struct
    mapping (address => Student) private students;

    // declare a function that allows students to register in the system
    function studentResgiter (string memory _name, string memory _id, string memory _program) public {
        students[msg.sender] = Student({
            name: _name,
            id: _id,
            programRegistered: _program,
            isRegistered: true
        });
    }

    // Declare a function to allow student to query themselves' results
    function getStudentRegistry () public  view returns (string memory, string memory, string memory, bool isRegistered) {
        
        return (
            students[msg.sender].name,
            students[msg.sender].id,
            students[msg.sender].programRegistered,
            students[msg.sender].isRegistered );
    }

    // Declare a function to allow contract owner to query results
    function getStudents (address _addr) onlyOwner public view  returns (string memory, string memory, string memory, bool isRegistered) {
        
        Student storage s = students[_addr];
        
        return (
            s.name,
            s.id,
            s.programRegistered,
            s.isRegistered );
    }
}

```





## Mapping from address to struct

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract StructTesting {

    // Declare a struct for student
    struct Student {
        string name;
        uint256 id;
        bool isAttended;
    }

    // Declare a state variable to hold value for all the students; mapping from address to struct
    mapping (address => Student) private students;

    // Decare a funciton to take attendance
    function registerAttendance (address _addr, string memory _name, uint256 _id, bool _isAttended) public {
                students[_addr] = Student({
                name: _name,
                id: _id,
                isAttended: _isAttended
        });
    }

    function getAttendanceInfo (address _addr) public view returns (string memory, uint256, bool) {
        return (students[_addr].name, students[_addr].id, students[_addr].isAttended);
    }

    function toggleAttendance (address _addr) public {
        students[_addr].isAttended = !students[_addr].isAttended;
    }
}
```



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
