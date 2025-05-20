const hre = require("hardhat");
async function main() {
    const BollCoin = await hre.ethers.getContractFactory("BollCoin");
    
    const gasEstimate = await hre.ethers.provider.estimateGas(BollCoin.getDeployTransaction());
    console.log("Estimated Gas:", gasEstimate.toString());
    
    const bollCoin = await BollCoin.deploy();
    await bollCoin.deployed();
    console.log("BollCoin deployed to:", bollCoin.address);
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});