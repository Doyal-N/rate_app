<script>
  import Flatpickr from "svelte-flatpickr";
  import "flatpickr/dist/themes/light.css";
  import { imask } from "@imask/svelte";

  let value, formattedValue;

  const options = {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: "today",
    time_24hr: true,
    element: "#picker",
  };

  const optionsInput = {
    mask: "{00}.000",
    lazy: false,
  };

  function accept({ detail: maskRef }) {
    value = maskRef.value;
  }

  async function getLastRate() {
    const res = await fetch("api/v1/last_rate");

    const data = await res.json();
    const lastRate = data["data"];
    return lastRate;
  }

  let promise = getLastRate();

  const formatDate = function (str) {
    let date = new Date(str);

    return date.toLocaleDateString();
  };

  async function createForcedRate() {
    await fetch("/api/v1/forced_rates", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-TOKEN": document.querySelector('[name="csrf-token"]').content,
      },
      body: JSON.stringify({
        rate: document.getElementById("userRate").value,
        show_until: document.getElementById("userDate").value,
      }),
    });
    getLastRate();
  }
</script>

{#await promise then rate}
  <form on:submit|preventDefault={createForcedRate}>
    <div class="form-group">
      <input
        id="userRate"
        type="text"
        name="rate"
        value={rate["rate"]}
        class="form-input"
        use:imask={optionsInput}
        on:accept={accept}
      />
      <label for="rate" class="form-label">Forced rate</label>
    </div>

    <div class="form-group">
      <Flatpickr {options} bind:value bind:formattedValue element="#picker">
        <div class="flatpickr" id="picker">
          <input
            id="userDate"
            name="show_until"
            class="form-input"
            type="text"
            value={formatDate(rate["show_until"])}
            placeholder={formatDate(rate["show_until"])}
            data-input
          />
        </div>
      </Flatpickr>
      <label for="show_until" class="form-label">Show datetime</label>
    </div>

    <input class="button" type="submit" />
  </form>
{:catch error}
  <form on:submit|preventDefault={createForcedRate}>
    <div class="form-group">
      <input
        id="userRate"
        type="text"
        name="rate"
        value=""
        use:imask={optionsInput}
        on:accept={accept}
        class="form-input"
      />
      <label for="rate" class="form-label">Forced rate</label>
    </div>

    <div class="form-group">
      <Flatpickr {options} bind:value bind:formattedValue element="#picker">
        <div class="flatpickr" id="picker">
          <input
            id="userDate"
            name="show_until"
            class="form-input"
            type="text"
            value=""
            placeholder=""
            data-input
          />
        </div>
      </Flatpickr>
      <label for="show_until" class="form-label">Show datetime</label>
    </div>

    <input class="button" type="submit" />
  </form>
{/await}

<style>
  form {
    width: 400px;
    padding: 32px;
    border-radius: 10px;
    box-shadow: 0 4px 16px #ccc;
    font-family: Georgia, "Times New Roman", Times, serif;
    letter-spacing: 1px;
  }

  .button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-family: sans-serif;
    letter-spacing: 1px;
    font-size: 16xp;
    color: #fff;
    background-color: #0071f0;
    outline: none;
    cursor: pointer;
    transition: 0.3s;
  }

  .form-group {
    position: relative;
    margin-bottom: 1.5rem;
  }

  .form-input {
    width: 100%;
    padding: 0 0 10px 0;
    border: none;
    border-bottom: 1px solid #e0e0e0;
    background-color: transparent;
    outline: none;
    transition: 0.3s;
  }

  .form-label {
    color: #9e9e9e;
    transition: 0.3s;
  }

  input {
    font-size: 1.3rem;
  }

  .button:focus,
  .button:hover {
    background-color: rgba(0, 113, 240, 0.7);
  }

  input:focus {
    border-bottom: 1px solid #1a73a8;
  }
</style>
