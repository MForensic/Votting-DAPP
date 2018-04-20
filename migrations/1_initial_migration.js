var Migrations = artifacts.require("./Migrations.sol");
var Voting     = artifacts.require("../contracts/Voting.sol")
module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Voting,['Superman','Spiderman']);
};
