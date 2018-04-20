// Compiler version to be used

pragma solidity ^0.4.11;

  /* Voting is contract name
  */
contract Voting {

    /* Mapping is used as associative array or hash. votesReceived uses bytes32 as key and unsigned 8 bit integer as value
  in other words it mapes candidate name to the number of votes it has received
  */
  mapping (bytes32 => uint8) public votesReceived;

  
  
  
   /* Solidity doesn't let you pass in an array of strings in the constructor (yet).
  We will use an array of bytes32 instead to store the list of candidates
  */

  bytes32[] public candidateList;
 
 /* The constructor function that is executed only when the contract is deployed. This 
function gets attached to the transaction that deployes the contract
  */
  
  function Voting(bytes32[] candidateNames) {
    candidateList = candidateNames;
  }

function Clist() returns(bytes32[]){
 return candidateList;
}




  // This function returns the total votes a candidate has received so far. It is a constant function(Deson't change any value or state)
  function totalVotesFor(bytes32 candidate) returns (uint8) {
    if (validCandidate(candidate) == false) throw;
    return votesReceived[candidate];
  }

  // This function increments the vote count for the specified candidate. This
  // is equivalent to casting a vote
  function voteForCandidate(bytes32 candidate) {
    if (validCandidate(candidate) == false) throw;
    votesReceived[candidate] += 1;
  }

//This function checks if the candidate is valid. In other words if the candidate is in the list that we initialized in contstructor function
  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}

