<?php require_once('include.php') ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=1080, initial-scale=1.0">
    <title>Hello, world!</title>
</head>
<body>
    <?php 
    if($connected) {
        if(isset($_GET['abonat']) && !empty($_GET['abonat'])) {
            if(isset($_GET['oferta']) && !empty($_GET['oferta'])) {
                if($conn->begin_transaction(MYSQLI_TRANS_START_READ_WRITE)) {
                    $persoana = $conn->prepare("SELECT Email FROM persoane WHERE Email=?");
                    $persoana->bind_param('s', $_GET['abonat']);
                    if($persoana->execute()) {
                        $conn->use_result(); $result = $persoana->get_result();
                        if($result && ($row = $result->fetch_row()) && $row[0]==$_GET['abonat']) {
                            $aboneaza = $conn->prepare("INSERT INTO abonati(Cod_Client, Email) VALUES (?, ?)");
                            $codClient = random_int(0, 99999); $aboneaza->bind_param('is', $codClient, $_GET['abonat']);
                            $gasit = true;
                            if($aboneaza->execute()) $client = $codClient;
                            else {
                                $abonat = $conn->prepare("SELECT Cod_Client FROM abonati WHERE Email=?");
                                $abonat->bind_param("s", $_GET['abonat']);
                                if($abonat->execute()) {
                                    $conn->use_result(); $result = $abonat->get_result();
                                    if($result && ($row = $result->fetch_row())) {
                                        $client = $row[0];
                                    } else {
                                    print("<i style=\"font-size:18pt;\">Abonatul nu a putut fi găsit: $conn->error</i>");
                                    $gasit = false;
                                    }
                                } else $gasit=false;
                            }
                            if($gasit) {
                                $oferta = $conn->prepare("SELECT ID FROM oferte WHERE Denumire=?");
                                $oferta->bind_param('s', $_GET['oferta']);
                                if($oferta->execute()) {
                                    $conn->use_result(); $result = $oferta->get_result();
                                    if($result && ($row = $result->fetch_row())) {
                                        $id = $row[0];
                                        $oferta = $conn->prepare("SELECT Oferta FROM abonamente WHERE Client=? AND Oferta=?");
                                        $oferta->bind_param('ii', $client, $id);
                                        if($oferta->execute()) {
                                            $conn->use_result(); $result = $oferta->get_result();
                                            if(is_null($result->fetch_row())) {
                                                $abonament = $conn->prepare("INSERT INTO abonamente (Client, Oferta) VALUES (?, ?)");
                                                $abonament->bind_param('ii', $client, $id);
                                                if($abonament->execute()) {
                                                    print("<i style=\"font-size:18pt;\">Abonamentul a fost salvat cu succes.</i>");
                                                    $conn->commit();
                                                } else {
                                                    print("<i style=\"font-size:18pt;\">Abonamentul nu a putut fi salvat: $conn->error</i>");
                                                    $conn->rollback();
                                                }
                                            } else {
                                                print("<i style=\"font-size:18pt;\">Sunteți deja abonat la această ofertă</i>");
                                                $conn->rollback();
                                            }
                                        } else $conn->rollback();
                                    } else {
                                        print("<i style=\"font-size:18pt;\">Oferta nu exista: $conn->error</i>");
                                        $conn->rollback();
                                    }
                                } else {
                                    print("<i style=\"font-size:18pt;\">Nu am putut extrage oferta: $conn->error</i>");
                                    $conn->rollback();
                                }
                            } else $conn->rollback();
                        } else {
                            print("<i style=\"font-size:18pt;\">Persoana care se abonează nu există: $conn->error</i>");
                            $conn->rollback();
                        }
                    } else {
                        print("<i style=\"font-size:18pt;\">Eroare la verificarea existenței persoanei: $conn->error</i>");
                        $conn->rollback();
                    }
                } else print("<i style=\"font-size:18pt;\">Nu am putut iniția tranzacția: $conn->error</i>");
                $email = $_GET['abonat'];
                print("<br><a style=\"font-size:18pt;\" href=\"abonat.php?p=$email\">Vezi ofertele la care ești abonat.</a>");
            }
        }
    }
    ?>
    <h1>Salut. Bine ați venit pe prima pagină.</h1>
    <h3>Acest serviciu este menit să ofere clienților programul TV pentru anumite posturi.</h3>
    <div style="font-size:14pt">
    <ul>
        <li><a style="font-size:16pt;" href="http://<?php echo $_SERVER['SERVER_NAME'];?>"><i>Întoarce-te acasă</i></a></li>
    </ul>
    <?php 
        if($connected) {
            if(isset($_GET['p']) && !empty($_GET['p'])) { 
                $oferta = $_GET['p'];
                $sql = "SELECT oferte.*, pachetetv.Denumire as Pachet FROM oferte
                INNER JOIN pachetetv ON Pachet=pachetetv.ID
                WHERE oferte.Denumire=?;";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param('s', $oferta);
            } else {
                $sql = "SELECT oferte.*, pachetetv.Denumire as Pachet FROM oferte
                INNER JOIN pachetetv ON Pachet=pachetetv.ID;";
                $stmt = $conn->prepare($sql);
            }
            if($conn->begin_transaction(MYSQLI_TRANS_START_READ_ONLY)) {
                if($stmt->execute()) {
                    if(($result = $stmt->get_result()) && $conn->commit()) {
                        if($result) {
                            $row = $result->fetch_assoc();
                            if($row != null) {
                                print("<table>");
                                print("<tr>");
                                foreach ($row as $collumn => $value) {
                                    print("<th>$collumn</th>");
                                }
                                print("</tr>");
                                do {
                                    print("<tr>");
                                    foreach ($row as $collumn => $value) {
                                        if($collumn == "Denumire") {
                                            if(isset($_GET['abonat']) && !empty($_GET['abonat'])): ?>
                                                <td>
                                                    <a href="<?php echo $_SERVER["PHP_SELF"];?>?abonat=<?php echo $_GET['abonat'];?>&oferta=<?php echo $value;?>"><?php echo $value; ?></a>
                                                </td>
                                            <?php endif;
                                        }
                                        if($collumn == "Pachet" && !(isset($_GET['abonat']) && !empty($_GET['abonat']))) {
                                            print("<td><a href=\"posturi.php?p=$value\">$value</a></td>");
                                        } else print("<td>$value</td>");
                                    }
                                    print("</tr>");
                                } while($row = $result->fetch_assoc());
                                print("</table>");
                            } else print("Nici un rezultat.");
                        } else print("Eroare la preluarea rezultatelor: $conn->error");
                    } else print("Eroare la commit: $conn->error");
                } else {
                    print("Eroare la extragerea datelor: $conn->error");
                    $conn->rollback();
                }
            }
        }
    ?>
    </div>
</body>
</html>