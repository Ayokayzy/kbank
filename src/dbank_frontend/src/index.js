import { dbank_backend } from "../../declarations/dbank_backend";

window.addEventListener("load", async function () {
  const currentBalance = await dbank_backend.checkBalance();
  document.getElementById("value").innerHTML =
    Math.round(currentBalance * 100) / 100;
});

document.querySelector("form").addEventListener("submit", async function (e) {
  e.preventDefault();

  const button = e.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(
    document.getElementById("withdrawal-amount").value
  );

  button.setAttribute("disabled", true);

  await dbank_backend.topUp(inputAmount);

  const currentBalance = await dbank_backend.checkBalance();
  document.getElementById("value").innerHTML =
    Math.round(currentBalance * 100) / 100;

  button.removeAttribute("disabled");
});
