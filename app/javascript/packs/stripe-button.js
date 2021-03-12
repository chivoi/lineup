const button = document.querySelector("[data-stripe='payment']");

function createSession(event) {
  event.preventDefault()
  const csrfToken = document.querySelector("[name='csrf-token']").content
  const {publicKey, path} = button.dataset
  const name = document.getElementById('name').value
  const email = document.getElementById('email').value
  const amount = document.getElementById('amount').value
  fetch(path, {
    method: "POST",
    headers : {
    "X-CSRF-Token": csrfToken,
    "Content-Type": "application/json"
    },
    body: JSON.stringify({name, email, amount})
    })
    .then(response => response.json())
    .then(data => {
    const {sessionId} = data;
    const stripe = Stripe(
    publicKey
    );
    stripe.redirectToCheckout({
    sessionId: sessionId
    });
    })
    
    
}


if (button) {
  button.addEventListener("click", createSession)

}
