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
            if(isset($_GET['s']) && $_GET['s']==1) {
                if($conn->begin_transaction(MYSQLI_TRANS_START_READ_WRITE)) {
                    $client = null; $oferta = null;
                    if(isset($_GET['p']) && !empty($_GET['p'])) {
                        $client = $conn->prepare("SELECT Cod_Client FROM abonati WHERE Email=?");
                        $client->bind_param('s', $_GET['p']);
                        if($client->execute()) {
                            $conn->use_result();
                            if($result = $client->get_result())
                                $codClient = (!is_null($row=$result->fetch_row()))?$row[0]:null;
                            $client = $codClient;
                        } else $conn->rollback();
                    }
                    if(isset($_GET['o']) && !empty($_GET['o'])) {
                        $oferta = $conn->prepare("SELECT ID FROM oferte WHERE Denumire=?");
                        $oferta->bind_param('s', $_GET['o']);
                        if($oferta->execute()) {
                            $conn->use_result();
                            if($result = $oferta->get_result()) 
                                $idOferta = (!is_null($row=$result->fetch_row()))?$row[0]:null;
                            $oferta = $idOferta;
                        }
                    }
                    if(!is_null($oferta)) {
                        if(!is_null($client)) {
                            $sterge = $conn->prepare("DELETE FROM abonamente WHERE Client=? AND Oferta=?");
                            $sterge->bind_param("ii", $client, $oferta); ?>
                            <?php if($sterge->execute()): ?>
                                <?php 
                                $abonamente = $conn->prepare("SELECT ID FROM abonamente WHERE Client=?");
                                $abonamente->bind_param('i', $client);
                                if($abonamente->execute()):
                                    $conn->use_result(); 
                                    if($result = $abonamente->get_result()):
                                        if(is_null($row=$result->fetch_row())):
                                            $sterge = $conn->prepare("DELETE FROM abonati WHERE Email=?");
                                            $sterge->bind_param('s', $_GET['p']); ?>
                                            <?php if($sterge->execute()): ?>
                                                <i style="font-size:16pt;">Persoana nu mai este abonat.</i>
                                            <?php endif; 
                                        else: ?>
                                            <i style="font-size:16pt;">Persoana a fost dezabonată cu succes de la ofertă.</i>
                                        <?php endif;
                                        $conn->commit();
                                    else: ?>
                                        <i style="font-size:16pt;">A apărut o eroare la dezabonare: <?php echo $conn->error; ?></i>
                                        <?php $conn->rollback(); ?>
                                    <?php endif;
                                else: ?>
                                    <i style="font-size:16pt;">A apărut o eroare la dezabonare: <?php echo $conn->error; ?></i>
                                    <?php $conn->rollback(); ?>
                                <?php endif; ?>
                            <?php else: ?>
                                <i style="font-size:16pt;">A apărut o eroare la dezabonare: <?php echo $conn->error; ?></i>
                                <?php $conn->rollback(); ?>
                            <?php endif;
                        } else {
                            $oferta = $conn->prepare("SELECT ID FROM oferte WHERE Denumire=?");
                            $oferta->bind_param('s', $_GET['o']);
                            if($oferta->execute()):
                                $conn->use_result(); $result = $oferta->get_result();
                                $id = ($result && !is_null($row = $result->fetch_row()))?$row[0]:null;
                                if(!is_null($id)):
                                    $abonati = $conn->prepare("SELECT Client FROM abonamente WHERE Oferta=?");
                                    $abonati->bind_param('i', $id);
                                    if($abonati->execute()):
                                        $conn->use_result(); $result = $abonati->get_result();
                                        if($result):
                                            $sters=true;
                                            while($row = $result->fetch_row()) {
                                                $sterge = $conn->prepare("DELETE FROM abonamente WHERE Oferta=? AND Client=?");
                                                $sterge->bind_param("ii", $id, $row[0]);
                                                if(!$sterge->execute()) { $sters=false; break; }
                                            } ?>
                                            <?php if($sters): ?>
                                                <i style="font-size:16pt;">Oferta a fost ștearsă cu succes</i>
                                                <?php $conn->commit(); ?>
                                            <?php else: ?>
                                                <i style="font-size:16pt;">Oferta nu a fost ștearsă</i>
                                                <?php $conn->rollback(); ?>
                                            <?php endif;
                                        else: ?>
                                            <i style="font-size:16pt;">Nu există clienți abonați la ofertă</i>
                                            <?php $conn->rollback(); ?>
                                        <?php endif;
                                    else: ?>
                                        <i style="font-size:16pt;">A apărut o eroare la verificarea abonaților la ofertă: <?php echo $conn->error; ?></i>
                                        <?php $conn->rollback(); ?>
                                    <?php endif;
                                else: ?>
                                    <i style="font-size:16pt;">Nu există această ofertă.</i>
                                    <?php $conn->rollback(); ?>
                                <?php endif;
                            else: ?>
                                <i style="font-size:16pt;">A apărut o eroare la căutarea ofertei: <?php echo $conn->error; ?></i>
                                <?php $conn->rollback(); ?>
                            <?php endif;
                        }
                    } else $conn->rollback();
                }
            }
        }
    ?>
    <h1>Salut. Bine ați venit pe prima pagină.</h1>
    <h3>Acest serviciu este menit să ofere clienților programul TV pentru anumite posturi.</h3>
    <div style="font-size:14pt">
    <?php
    if($connected) {
        $abonat = false;
        if(isset($_GET['p']) && !empty($_GET['p'])) {
            $email = $_GET['p'];
            $sql = "SELECT Cod_Client, Email, oferte.Denumire FROM abonati 
            INNER JOIN abonamente ON Client=Cod_Client 
            INNER JOIN oferte ON oferte.ID=Oferta
            WHERE Email=?;";
            $stmt = $conn->prepare($sql) or die("Eroare la intocmirea comenzii: $conn->error");
            $stmt->bind_param('s', $email);
            $abonat = true;
        } else { ?>
        <ul>
            <li><a style="font-size:16pt;" href="http://<?php echo $_SERVER['SERVER_NAME'];?>"><i>Întoarce-te acasă</i></a></li>
        </ul>
        <?php $sql = "SELECT Cod_Client, Email, oferte.Denumire FROM abonati 
            INNER JOIN abonamente ON Client=Cod_Client 
            INNER JOIN oferte ON oferte.ID=Oferta";
            $stmt = $conn->prepare($sql) or die("Eroare la intocmirea comenzii: $conn->error");
        }
        if($connected && $conn->begin_transaction(MYSQLI_TRANS_START_READ_ONLY)) {
            if($stmt->execute()) {
                if(($result = $stmt->get_result()) && $conn->commit()) {
                    if($result) {
                        $row = $result->fetch_assoc(); ?>
                        <?php if($row != null): ?>
                            <?php if($abonat): ?>
                            <ul>
                                <li><a style="font-size:16pt;" href="<?php echo "oferta.php?abonat=$email"?>"><i>Doriți să vă abonați la o ofertă?</i></a></li>
                                <li><a style="font-size:16pt;" href="http://<?php echo $_SERVER['SERVER_NAME'];?>"><i>Întoarce-te acasă</i></a></li>
                            </ul>
                            <?php endif; ?>
                            <table>
                                <tr> 
                                <?php foreach ($row as $collumn => $value) {
                                    print("<th>$collumn</th>");
                                } ?> 
                                </tr>
                                <?php do {
                                    print("<tr>"); $oferta="";
                                    foreach ($row as $collumn => $value) {
                                        if($collumn == "Denumire") {
                                            $oferta=$value;
                                            print("<td><a href=\"oferta.php?p=$value\">$value</a></td>");
                                        } else print("<td>$value</td>");
                                    } ?>
                                    <?php if(isset($email)): $attr="?p=$email&s=1&o=$oferta"; ?>
                                    <?php else: $attr="?s=1&o=$oferta"; endif; ?>
                                    <td><a href="<?php echo $_SERVER["PHP_SELF"].$attr; ?>">Șterge</a></td>
                                    <?php print("</tr>");
                                } while($row = $result->fetch_assoc()); ?>
                            </table>
                        <?php else: ?>
                            <div style="font-size:18pt;"><i>Nu sunteți abonat la nici o ofertă.</i></div>
                            <?php if($abonat): ?>
                            <ul>
                                <li><a style="font-size:16pt;" href="<?php echo "oferta.php?abonat=$email"?>"><i>Doriți să vă abonați la o ofertă?</i></a></li>
                                <li><a style="font-size:16pt;" href="http://<?php echo $_SERVER['SERVER_NAME'];?>"><i>Întoarce-te acasă</i></a></li>
                            </ul>
                            <?php endif;?>
                        <?php endif;
                    } else print("Nu am rezultate: $conn->error");
                } else print("Eroare la commit: $conn->error");
            } else {
                print("Eroare in timpul tranzactiei: $conn->error");
                $conn->rollback();
            }
        } else print("Eroare la pornirea tranzactiei: $conn->error");
    }
    ?>
    </div>
</body>
</html>