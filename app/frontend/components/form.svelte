<script>
  import Flatpickr from "svelte-flatpickr";
  import "flatpickr/dist/themes/light.css";
  import { imask } from "@imask/svelte";
  import Notification from "./notification";

  let value,
    formattedValue,
    errorsText = "";

  async function showNotify(response) {
    if (response["status"] === 200) {
      let notify = document.getElementById("notify");
      notify.classList.remove("d-none");
      document.getElementById("text").textContent =
        "Forced rate succesfully created!";
    } else {
      let data = await response.json(),
        errors = data["errors"];

      notify.classList.remove("alert-primary", "d-none");
      notify.classList.add("alert-danger");

      errors.forEach((element) => {
        errorsText += element + "</br>";
      });
      document.getElementById("text").innerHTML = errorsText;
    }
  }

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
    let time = date.toLocaleTimeString(navigator.language, {
      hour: "2-digit",
      minute: "2-digit",
    });

    return `${date.toLocaleDateString()} ${time}`;
  };

  async function createForcedRate() {
    const response = await fetch("/api/v1/forced_rates", {
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
    showNotify(response);
  }
</script>

<div class="row">
  <div class="col">
    {#await promise then rate}
      <Notification />
      <form
        class="shadow-lg p-3 mb-5 bg-body rounded"
        on:submit|preventDefault={createForcedRate}
      >
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

        <button class="btn btn-success" type="submit">Change rate</button>
      </form>
    {:catch error}
      <Notification />
      <form
        class="shadow-lg p-3 mb-5 bg-body rounded"
        on:submit|preventDefault={createForcedRate}
      >
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

        <button class="btn btn-success" type="submit">Change rate</button>
      </form>
    {/await}
  </div>
</div>

<style>
  form {
    width: 400px;
    padding: 32px;
    border-radius: 10px;
    box-shadow: 0 4px 16px #ccc;
    font-family: Georgia, "Times New Roman", Times, serif;
    letter-spacing: 1px;
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

  input:focus {
    border-bottom: 1px solid #1a73a8;
  }
</style>
