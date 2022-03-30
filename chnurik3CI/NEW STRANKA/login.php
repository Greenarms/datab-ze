<?php include('./parts/header.php')?>
<?php
$error = isset($_GET["massage"]) ? $_GET["massage"] : "";

?>
  <main>  
  <form action="login_script.php" method="post">
        <div class="container">
          <h1>Prihlasenie</h1>
          <hr>
          <p><label for="username"><b>Meno</b></label>
          <br><input type="text" placeholder="Zadajte Meno" name="username" id="username" required>
            
          <p><label for="psw"><b>Heslo</b></label>
          <br><input type="password" placeholder="Zadajte Heslo" name="psw" id="psw" required>
      
          <p><button type="submit" class="btn btn-secondary">Prihlasit sa</button>
          <hr>
          <p style="font-weight: bolder;">Nemate ucet? <p><a href="register.php" class="btn btn-info">Zaregistrujte sa</a></p>
        </div>
        <p class="text-danger text-center"><?php echo $error ?></p>    
      </form>
  </main>
  <?php include('./parts/footer.php')?>  

</html>