<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="login.css">
  
<body>
<a href="index.php">Home</a>
    <form action="../php.scripts/LoginScript.php" method="post">
        <div class="container">
            
          <p><label for="uname"><b>Uzivatelske meno</b></label>
          <input type="text" placeholder="Zadajte meno" name="meno" required>
            
          <p><label for="psw"><b>Heslo</b></label>
          <input type="password" placeholder="Zadajte heslo" name="heslo" required>
      
          <p><input type="submit" value="Login"/>
          <p></p><span class="psw">Zabudli ste <a href="#">heslo?</a></span>
        </div>     
      </form>
</body>
</html>