<!DOCTYPE html>
<html>
    <body>
    <a href="index.php">Home</a>
        <?php
            if($_POST['meno'] == "m" && $_POST['heslo'] == "k"){
                echo "Prihlasil si sa";
            }
            else{
                echo "Zadal si nespravne meno alebo heslo";
                header('Location: login.php');
            }
        ?>
    </body>
</html>