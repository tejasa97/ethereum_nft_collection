const main = async () => {
  const nftFactory = await hre.ethers.getContractFactory("EpicNFT");
  const nftContract = await nftFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed to: ", nftContract.address);

    //   Call the minting function
    let txn = await nftContract.makeEpicNFT();
    await txn.wait();
    
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
