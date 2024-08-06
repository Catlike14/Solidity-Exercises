// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract StudentDB {
    /* This exercise assumes you know how structs works.
   create a struct `Student` for a student who's name is `John` and age is `12`.
   Return John's age in the function below */

    struct Student {
        string name;
        uint256 age;
    }

    Student student;

    constructor() {
        createStudent("John", 12);
    }

    // create Student's data
    function createStudent(string memory name, uint256 age) public {
        student = Student(name, age);
    }

    // return struct data
    function getEntireStruct() public view returns (Student memory) {
        return student;
    }
}
