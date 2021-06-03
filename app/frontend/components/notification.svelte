<script>
  const close = function () {
    let btnClose = document.querySelector(".btn-close"),
      notify = document.getElementById("notify");

    if (btnClose) {
      notify.classList.add("d-none");
    }
  };
</script>

<div id="notify" class="d-flex alert alert-primary d-none">
  <button
    type="button"
    on:click={close}
    class="mr-4 btn-close"
    aria-label="Close"
  />
  <span id="text" role="alert" />
</div>

<style>
</style>
