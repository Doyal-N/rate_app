<script>
  import { createConsumer } from "@rails/actioncable";

  const consumer = createConsumer();

  consumer.subscriptions.create("RateChannel", {
    connected() {},

    received(data) {
      let block = document.getElementById("rate");
      if (block) {
        block.textContent = data;
      }
    },
  });
</script>

<div class="window">
  <h1>Current rate USD/RUB</h1>
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
  }

  #rate {
    border-bottom: 2px solid black;
    text-align: center;
    font-size: 2.4rem;
    color: rgb(14, 210, 236);
  }
</style>
