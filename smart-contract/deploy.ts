import { ethers } from "hardhat"

const main = async () => {
    const contract =  await ethers.getContractFactory('NFTContract');
    const deployContract = await contract.deploy("DressClub NFT","DCNFT", "https://magenta-absent-shrimp-493.mypinata.cloud/ipfs/QmcdVJG4UMPbxZwju6odUDxGWMouW1ruPR5tj6GMBpF1EM/");
    const address = await deployContract.getAddress();
    console.table({contract: "NFTContract", address})

}

main().then(() => {
    process.exit(0);
}).catch((error) => {
    console.error(error);
})