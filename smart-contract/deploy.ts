import { ethers } from "hardhat"

const main = async () => {
    const contract =  await ethers.getContractFactory('Demo');
    const deployContract = await contract.deploy("deployed");
    const address = await deployContract.getAddress();
    console.table({contract: "Demo", address})
}

main().then(() => {
    process.exit(0);
}).catch((error) => {
    console.error(error);
})