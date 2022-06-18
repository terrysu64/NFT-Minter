const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory("NFTMinter");
    const nftContract  = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log(`NFT Contract deployed to ${nftContract.address}`)

    let txn = await nftContract.NFTMint()
    await txn.wait()

};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    }
    catch (error) {
        console.log(`Deployment error: ${error}`);
        process.exit(1);
    }
}

runMain();