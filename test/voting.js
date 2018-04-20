Voting = artifacts.require('../contracts/Voting.sol');

contract('Voting', function() {
   // it("should assert true", function(done) {
   //   var voting = Voting.deployed();
   //   assert.isTrue(true);
   //   done();
   // });
    const voting = Voting.deployed(['a','b']);

  it("should add users during deployment", function(){

    return voting.then(instance=>{
      //console.log(instance)

    return  instance.validCandidate.call("a").then(result=>{
    //  console.log(result);
  //expect(instance.validCandidate('a')).to.be.a(true);
        assert.isTrue(result);

      });


    });
  });

it("Should add the vote to the respective user", function(){
  return voting.then(instance1=>{
    //console.log(instance1)
    return instance1.voteForCandidate("a").then(tx=>{
    //  console.log(tx)
      return instance1.totalVotesFor.call("a").then(r =>{
        //console.log(r)
        assert.equal(r,1,"One vote is added to the candidate");

    });


  });


});


});

it("should not return false for any invalid candidate", function(){

  return voting.then(instance2=>{
      return  instance2.validCandidate.call("c").then(anything=>{

        assert.isFalse(anything);
      })


  })

})



});
