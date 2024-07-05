import { expect } from "chai";
import hre from "hardhat";


describe("Demo", async () => {
    it('test 1', async () => {
      const demo = await hre.ethers.getContractFactory("Demo");
      const demoDeployed = await demo.deploy("deployed");
      const message = await demoDeployed.getMessage();
      expect(message).to.equal('deployed')
    });

    it('test 2', async () => {
      const demo = await hre.ethers.getContractFactory("Demo");
      const demoDeployed = await demo.deploy("deployed");
      await demoDeployed.setMessage("new_message");
      const newMessage = await demoDeployed.getMessage();
      expect(newMessage).to.equal('new_message')
    });
});
