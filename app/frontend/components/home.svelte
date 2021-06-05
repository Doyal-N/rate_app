<script>
  import { createConsumer } from "@rails/actioncable";

  function renderCurrentValue(value) {
    if (value !== null) {
      document.getElementById("rate").innerHTML = value;
    } else {
      document
        .querySelector(".window")
        .insertAdjacentHTML("beforeend", renderLoading());
    }
  }

  async function getRate() {
    const res = await fetch("api/v1/current_rate");
    const dataToJson = await res.json();
    renderCurrentValue(dataToJson["data"]);
  }

  function renderLoading() {
    return `<div class="d-flex justify-content-center">
              <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
            </div>`;
  }

  const consumer = createConsumer();

  consumer.subscriptions.create("RateChannel", {
    connected() {
      getRate();
    },

    received(data) {
      if (document.getElementById("rate")) {
        renderCurrentValue(data);
      }
    },
  });
</script>

<div class="window">
  <h1 class="main-title">Current rate USD/RUB</h1>
  <div id="rate" />
</div>

<style>
  h1 {
    font-size: 2rem;
    font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande",
      "Lucida Sans", Arial, sans-serif;
  }

  .window {
    padding: 20px 50px;
    border-bottom: 2px solid black;
  }

  #rate {
    text-align: center;
    font-size: 2.4rem;
    color: rgb(14, 210, 236);
  }
</style>
