const { ethers } = require("hardhat");
const { use, expect } = require("chai");
const { solidity } = require("ethereum-waffle");

use(solidity);

describe("My Dapp", function () {
  let myContract;

  // quick fix to let gas reporter fetch data from gas station & coinmarketcap
  before((done) => {
    setTimeout(done, 2000);
  });

  describe("PiggyBank", function () {
    it("Should deploy PiggyBank", async function () {
      const PiggyBank = await ethers.getContractFactory("PiggyBank");

      myContract = await PiggyBank.deploy();
    });

    describe("deposit()", function () {
      it("Should be able to deposit ETH", async function () {
        const newDeposit = 0.25;
        const [owner] = await ethers.getSigners();

        await myContract.deposit(newDeposit);
        expect(await myContract.checkBalance(owner.address)).to.equal(newDeposit);
      });

      it("Should emit a Deposit event ", async function () {
        const [owner] = await ethers.getSigners();

        const newDeposit = 0.7;

        expect(await myContract.deposit(newDeposit))
          .to.emit(myContract, "Deposit")
          .withArgs(owner.address, newDeposit);
      });
    });
  });
});
