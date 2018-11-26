var SimpleFaucet = artifacts.require ("./SimpleFaucet.sol");

module.exports = function(deployer) {
  deployer.deploy(SimpleFaucet);
}