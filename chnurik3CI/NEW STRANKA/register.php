<?php include('./parts/header.php')?>
<title>Register</title>

  <body>

  <?php $error = isset($_GET["message"]) ? $_GET["message"] : "";
        $error2 = isset($_GET["messages"]) ? $_GET["messages"] : "";
  ?>
    <main>
      <form action="register_script.php" method="post">

        <div class="container">
          <h1>Registracia</h1>
          <hr>
          <p><label for="username"><b>Meno</b></label>
            <br><input type="text" placeholder="Zadajte Meno" name="username" id="username" required>

          <p><label for="surname"><b>Priezvisko</b></label>
            <br><input type="text" placeholder="Zadajte Priezvisko" name="surname" id="surname" required>

          <p><label for="email"><b>Email</b></label>
            <br><input type="text" placeholder="Zadajte Email" name="email" id="email" required>

          <p><label for="psw"><b>Heslo</b></label>
            <br><input type="password" placeholder="Zadajte Heslo" name="psw" id="psw" required>

          <p><label for="psw-repeat"><b>Heslo znova</b></label>
            <br><input type="password" placeholder="Znovu Zadajte heslo" name="psw-repeat" id="psw-repeat" required>

          <p><button type="submit" class="btn btn-secondary">Registrovat sa</button>
            <hr>
          <p>
          <p style="font-weight: bolder;">Uz mate ucet?
          <p><a href="login.php" class="btn btn-info">Prihlaste sa</a></p>
          <p class="text-danger"><?php echo $error ?></p>
          <p class="text-danger"><?php echo $error2 ?></p>
        </div>

      </form>
    </main>
  </body>
  <?php include('./parts/footer.php')?>
</html>