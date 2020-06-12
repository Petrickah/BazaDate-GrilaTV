<?php require_once('include.php') ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=1080, initial-scale=1.0">
    <title>Hello, world!</title>
</head>
<body>
    <h1>Salut. Bine ați venit pe prima pagină.</h1>
    <h3>Acest serviciu este menit să ofere clienților programul TV pentru anumite posturi.</h3>
    <div style="font-size:14pt;">
    <p><i>Lista persoanelor înregistrate:</i></p>
    <ul>
    <li><a href="adauga/persoane.php">Înregistrează-te în baza de date</a></li>
    <li><a href="<?php echo $_SERVER['PHP_SELF'];?>?abonati=1">Vezi persoanele abonate la oferte</a></li>
    <li><a href="<?php echo $_SERVER['PHP_SELF'];?>">Vezi toate persoanele</a></li>
    <li><a href="http://<?php echo $_SERVER['SERVER_NAME'];?>">Întoarce-te acasă</a></li>
    </ul>
        <?php 
            if($connected){
                if(!isset($_GET['abonati'])) {
                    $persoane = $conn->prepare("SELECT * FROM persoane;");
                } else if($_GET['abonati']==1) {
                    if($connected && $conn->begin_transaction(MYSQLI_TRANS_START_READ_WRITE)) {
                        $abonati = $conn->prepare("SELECT * FROM abonamente;");
                        if($abonati->execute()) {
                            $conn->use_result(); $result=$abonati->get_result();
                            if(($result && is_null($row=$result->fetch_row()))) {
                                $sterge = $conn->prepare("DELETE FROM abonati;");
                                if($sterge->execute()) $conn->commit();
                                else $conn->rollback();
                            } else $conn->rollback();
                        } else $conn->rollback();
                    }
                    $persoane = $conn->prepare(
                        "SELECT persoane.* 
                        FROM abonati, persoane
                        WHERE abonati.Email=persoane.Email;");
                }
            }
            if($connected && $conn->begin_transaction(MYSQLI_TRANS_START_READ_ONLY)) {
                if($persoane->execute()) {
                    $conn->use_result(); $result = $persoane->get_result();
                    if($result): ?>
                        <?php if(is_null($row = $result->fetch_assoc())): ?>
                            <i style="font-size:16pt;">Nu există persoane abonate</i>
                            <?php $conn->rollback(); ?>
                        <?php else: ?>
                            <table>
                                <?php
                                print("<tr>");
                                foreach ($row as $collumn => $value) { ?>
                                    <th><?php print($collumn); ?></th>
                                <?php }
                                print("<tr>");
                                do {
                                    print("<tr>");
                                    foreach ($row as $collumn => $value) { ?>
                                        <td><?php 
                                            if($collumn == 'Email') {
                                                print("<a href=\"abonat.php?p=$value\">$value</a>");
                                            } else print($value); 
                                        ?></td>
                                    <?php }
                                    print("</tr>");
                                } while($row = $result->fetch_assoc()); ?>
                            </table>
                            <?php $conn->commit(); ?>
                        <?php endif; ?>
                    <?php endif;
                }
            }
        ?>
    </div>
</body>
</html>