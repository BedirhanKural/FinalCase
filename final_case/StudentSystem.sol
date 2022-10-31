// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract studentSystem{
    address public owner;//create owner variable
    uint public studentCounter;
    constructor(){
        owner=msg.sender;//Assigning the owner variable at the beginning of the contract
    }
    modifier onlyOwner{//Changes must be only by owner.
        require(owner==msg.sender,"You are not Authorized.");//check owner.
        _;
    }
    struct Student{
        uint studentNo;
        string name;
        string surName;
        string Faculty;
        string Department;
        string[2] Courses;
        uint RegisterTime;
        bool Exists;
    }
    //mapping was defined to reach students by their id number.
    mapping(uint=>Student) public Students;
    //function is defined to add students.
    function addStudent (
        uint _studentNo,string memory _name,string memory _Surname,string memory _Faculty,string memory _Course1,
        string memory _Course2,string memory _Department) external onlyOwner{
            studentCounter++;
            uint studentId=studentCounter;
            Student memory student;
            student.studentNo=_studentNo;
            student.name=_name;
            student.surName=_Surname;
            student.Faculty=_Faculty;
            student.Department=_Department;
            student.Courses[0]=_Course1;
            student.Courses[1]=_Course2;
            student.RegisterTime=block.timestamp;//UNİX TIME
            student.Exists=true;
            Students[studentCounter]=student;
        }
        //Delete student with student id.
        function removeStudent(uint _studentId) external onlyOwner{
            delete Students[_studentId];
        }
}
