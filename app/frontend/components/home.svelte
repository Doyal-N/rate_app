<script>
  async function getStartRate() {
    const res = await fetch(`https://www.cbr-xml-daily.ru/daily_json.js`);
    const rates = await res.json();
    const rateUsd = rates["Valute"]["USD"]["Value"];

    if (res.ok) {
      return rateUsd;
    } else {
      throw new Error(rateUsd);
    }
  }

  // let promise = getStartRate();
</script>

<!-- {#await promise then value} -->
<div class="window">
  <h1>Current rate USD/RUB</h1>
  <div id="rate" />
</div>
<!-- {:catch error} -->
<!-- <div class="window">
  <h1>Current rate USD/RUB</h1>
  <div id="rate">Попробуйте еще раз или вернитесь позднее!</div>
</div> -->

<!-- {/await} -->
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
