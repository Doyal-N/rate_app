<script>
  import { Router, link, Route } from "svelte-routing";
  import Home from "./components/home";
  import Form from "./components/form";

  export let url = "";
</script>

<Router {url}>
  <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
      <a href="/" class="link text-dark" use:link>Home</a>
      <a href="admin" class="link text-dark" use:link>Change rate</a>
    </div>
  </nav>
  <div class="container">
    <Route path="/admin" component={Form} />
    <Route path="/"><Home /></Route>
  </div>
</Router>

<style>
  .container {
    margin: auto;
    display: flex;
    justify-content: center;
    align-items: baseline;
    height: 90vh;
  }

  .navbar {
    margin-bottom: 1rem;
    font-size: 1.6rem;
  }

  .link {
    text-decoration: none;
  }
</style>
