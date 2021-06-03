<script>
  export let notifyClass = "alert alert-primary";

  const close = function () {
    let btnClose = document.querySelector(".btn-close"),
      notify = document.getElementById("notify");

    if (btnClose) {
      notify.classList.add("d-none");
    }
  };
</script>

<div id="notify" class="{notifyClass} d-none">
  <button type="button" on:click={close} class="btn-close" aria-label="Close" />
  <span id="text" role="alert" />
</div>

<style>
</style>
