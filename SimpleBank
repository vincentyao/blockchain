const SimpleBank = artifacts.require("SimpleBank");

contract("SimpleBank", accounts => {
  let bank;

  before(async () => {
    bank = await SimpleBank.deployed();
  });

  it("should deposit funds", async () => {
    const depositAmount = web3.utils.toWei("1", "ether");
    await bank.deposit({ from: accounts[0], value: depositAmount });

    const balance = await bank.getBalance({ from: accounts[0] });
    assert.equal(balance.toString(), depositAmount, "Deposit amount is incorrect");
  });

  it("should withdraw funds", async () => {
    const withdrawAmount = web3.utils.toWei("0.5", "ether");
    await bank.withdraw(withdrawAmount, { from: accounts[0] });

    const balance = await bank.getBalance({ from: accounts[0] });
    assert.equal(balance.toString(), web3.utils.toWei("0.5", "ether"), "Withdraw amount is incorrect");
  });

  it("should transfer funds", async () => {
    const transferAmount = web3.utils.toWei("0.2", "ether");
    await bank.transfer(accounts[1], transferAmount, { from: accounts[0] });

    const balanceSender = await bank.getBalance({ from: accounts[0] });
    const balanceReceiver = await bank.getBalance({ from: accounts[1] });

    assert.equal(balanceSender.toString(), web3.utils.toWei("0.3", "ether"), "Sender balance is incorrect");
    assert.equal(balanceReceiver.toString(), transferAmount, "Receiver balance is incorrect");
  });

  it("should not allow withdrawal more than balance", async () => {
    const withdrawAmount = web3.utils.toWei("1", "ether");
    try {
      await bank.withdraw(withdrawAmount, { from: accounts[0] });
      assert.fail("Withdrawal should have failed due to insufficient balance");
    } catch (error) {
      assert.include(error.message, "Insufficient balance", "Incorrect error message");
    }
  });

  it("should not allow transfer more than balance", async () => {
    const transferAmount = web3.utils.toWei("1", "ether");
    try {
      await bank.transfer(accounts[1], transferAmount, { from: accounts[0] });
      assert.fail("Transfer should have failed due to insufficient balance");
    } catch (error) {
      assert.include(error.message, "Insufficient balance", "Incorrect error message");
    }
  });
});
