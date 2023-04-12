// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Poll {
    // Define the poll question and options
    string public question;
    string public option1 = "Yes";
    string public option2 = "No";
   
    // Define the vote count for each option
    uint public yesCount;
    uint public noCount;
   
    // Event to notify when a vote is cast
    event VoteCasted(address voter, string option);
   
    // Constructor to set the poll question
    constructor(string memory _question) {
        question = _question;
    }
   
    // Function to vote for option 1 (Yes)
    function voteYes() public {
        yesCount++;
        emit VoteCasted(msg.sender, option1);
    }
   
    // Function to vote for option 2 (No)
    function voteNo() public {
        noCount++;
        emit VoteCasted(msg.sender, option2);
    }
   
    // Function to get the poll results
    function getResults() public view returns (string memory) {
        if (yesCount > noCount) {
            return option1;
        } else if (noCount > yesCount) {
            return option2;
        } else {
            return "Tie";
        }
    }
}
