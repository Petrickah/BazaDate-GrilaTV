<?php require_once('../include.php') ?>
<?php $submit = false; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=100%, initial-scale=1.0">
    <title>Hello, world!</title>
    <style>
        .input {width:352px;font-size:16pt;margin-top:4pt;margin-bottom:4pt;} 
        .numar {width:62px;} .scara {width:15px;} 
        label {padding-left:1%;padding-right:1%;} 
        </style>
</head>
<body>
    <h1>Salut. Bine ați venit pe prima pagină.</h1>
    <h3>Acest serviciu este menit să ofere clienților programul TV pentru anumite posturi.</h3>
    <div style="font-size:16pt">
    <ul>
        <li>
            <a style="font-size:16pt;" href="http://<?php echo $_SERVER['SERVER_NAME'].'/'.explode("/", $_SERVER['PHP_SELF'])[2];?>">
                <i>Întoarce-te înapoi</i>
            </a>
        </li>
    </ul>
    <?php if(empty($_POST["submit"]) && !isset($_POST["submit"])) {?>
    <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post" style="width:60%">
        <label for="email" style="margin-right:4px;">Email:</label><input type="email" name="email" id="email" class="input">
        <label for="tel" style="margin-right:10px;">Telefon:</label><input type="tel" name="tel" id="tel" pattern="[0-9]{3}[0-9]{4}[0-9]{3}" class="input"><br>
        <label for="nume" style="margin-right:2px;">Nume:</label><input type="text" name="nume" id="nume" class="input">
        <label for="prenume">Prenume:</label><input type="text" name="prenume" id="prenume" class="input"><br>
        <div class="adresa">
            <label for="loc" style="margin-right:14px;">Oras:</label><input type="text" name="loc" id="loc" class="input">
            <label for="jud" style="margin-right:30px;">Judet:</label><input type="text" name="jud" id="jud" class="input"><br>
            <label for="str">Strada:</label><input type="text" name="str" id="str" class="input" style="width:auto;">
            <label for="nr" style="margin-right:8px;">Num.:</label><input type="text" name="nr" id="nr" pattern="[0-9]+([A-Z]{0,1}|-[0-9]{1,})" size="5" maxlength="5" class="input numar">
            <label for="bloc">Bloc: </label><input type="number" name="bloc" id="bloc" max="999" maxlength="3" class="input numar">
            <label for="scara">Scara.:</label><input type="text" name="scara" id="scara" pattern="[A-Z]{1}" size="1" maxlength="1" class="input scara">
            <label for="ap">Ap.:</label><input type="number" name="ap" id="ap" max="999" size="3" maxlength="3" class="input numar">
        </div>
        <button type="submit" name="submit" style="font-size:16pt;">Înregistrează-te</button>
    </form>
    <?php } else $submit=true; ?>
    <?php if($submit) {
        class Persoana {
            public function __construct() {
                $this->email = $_POST['email'];
                $this->tel = $_POST['tel'];
                $this->nume = $_POST['nume'];
                $this->prenume = $_POST['prenume'];
                $this->adresa = array(
                    'loc'=>$_POST['loc'],
                    'jud'=>$_POST['jud'],
                    'str'=>$_POST['str'],
                    'nr'=>$_POST['nr'],
                    'bl'=>$_POST['bloc'],
                    'sc'=>$_POST['scara'],
                    'ap'=>$_POST['ap']
                );
            }
            public function toPersoanaInsertSQLStatement() {
                global $conn;
                $sql = $conn->prepare("INSERT INTO `persoane`(`Email`, `Nume`, `Prenume`, `Telefon`) VALUES (?, ?, ?, ?)");
                $sql->bind_param('ssss', $this->email, $this->nume, $this->prenume, $this->tel);
                return $sql;
            }
            public function toAdresaUpdateSQLStatement() {
                global $conn;
                if(empty($this->adresa['loc']) || empty($this->adresa['jud']) || empty($this->adresa['str']) || empty($this->adresa['nr'])) {
                    return null;
                }
                $sql = $conn->prepare(
                    "UPDATE `persoane` 
                     SET `Oras`=?, `Judet`=?, `Strada`=?, `Numar`=?, `Bloc`=?, `Scara`=?, `Apartament`=?
                     WHERE `Email`=?
                    ");
                $sql->bind_param('ssssssis', 
                    $this->adresa['loc'], $this->adresa['jud'], $this->adresa['str'], $this->adresa['nr'], 
                    $this->adresa['bl'], $this->adresa['sc'],$this->adresa['ap'], $this->email);
                return $sql;
            }
        }
        $persoana = new Persoana();
        $pers = $persoana->toPersoanaInsertSQLStatement();
        $adresa = $persoana->toAdresaUpdateSQLStatement();
        print("<b><i>");
        if($connected && $conn->begin_transaction(MYSQLI_TRANS_START_READ_WRITE)) {
            if($pers->execute()) {
                if($adresa != null && $adresa->execute() && $conn->commit()) {
                    print("Înregistrare efectuată cu succes");
                } else {
                    if($adresa==null)
                        print("Introduceți adresa dumneavoastră.");
                    else print("Eroare la actualizarea adresei: $conn->error");
                    $conn->rollback();
                }
            }
            else {
                print("Eroare la înregistrare: $conn->error");
                $conn->rollback();
            }
        } else print($conn->error);
        print("</b></i>");
    } ?>
    </div>
</body>
</html>