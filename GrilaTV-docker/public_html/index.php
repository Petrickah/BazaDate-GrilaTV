<?php require_once('include.php') ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=1080, initial-scale=1.0">
    <title>Hello, world!</title>
    <style>.input {font-size:14pt;margin-left:5px;}th{font-size:14pt;}</style>
</head>
<body>
    <h1>Salut. Bine ați venit pe prima pagină.</h1>
    <h3>Acest serviciu este menit să ofere clienților programul TV pentru anumite posturi.</h3>
    <div style="font-size:18pt">
    <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
        <label for="cautare">Caută post:</label><input type="text" name="cautare" id="cautare" class="input">
        <input type="submit" value="Caută" class="input">
    </form><br>
    <?php if(!isset($_POST['cautare'])||empty($_POST['cautare'])): ?>
    <ul>
        <li><a href="persoane.php">Lista persoanelor</a></li>
        <li><a href="abonat.php">Lista abonatilor</a></li>
        <li><a href="oferta.php">Lista ofertelor</a></li>
        <li><a href="posturi.php">Lista posturilor TV</a></li>
        <li><a href="emisiuni.php">Lista emisiunilor</a></li>
    </ul>
    <?php else: ?>
        <i>Ați căutat cuvăntul <?php echo $_POST['cautare']?>:</i><br>
        <ul>
            <li><a style="font-size:16pt;" href="http://<?php echo $_SERVER['SERVER_NAME'];?>"><i>Întoarce-te acasă</i></a></li>
        </ul>
        <?php 
            $term = "%{$_POST['cautare']}%";
            try {
            if($connected) {
                if($conn->begin_transaction(MYSQLI_TRANS_START_READ_ONLY)) {
                    $posttv = $conn->prepare("SELECT * FROM posturitv WHERE Denumire LIKE ?");
                    $posttv->bind_param('s', $term);
                    if($posttv->execute()) {
                        $conn->use_result(); $result = $posttv->get_result(); ?>
                        <?php if($result): ?>
                        <table>
                        <?php $row = $result->fetch_assoc(); ?>
                        <?php if(is_null($row)){throw new Exception("Nici un post tv găsit", 1);} ?>
                            <tr>
                        <?php foreach ($row as $collumn => $value): ?>
                            <th><?php echo $collumn; ?></th>
                        <?php endforeach; ?>
                            <th>Oferta</th>
                            </tr>
                        <?php do { ?>
                            <tr>
                            <?php $idPachet=0; ?>
                            <?php foreach ($row as $collumn => $value): ?>
                                <?php if($collumn == "PachetTV"): ?>
                                    <?php 
                                        $pachet = $conn->prepare("SELECT * FROM pachetetv WHERE ID=?");
                                        $pachet->bind_param('i', $value);
                                        $idPachet=$value;
                                        if($pachet->execute()): ?>
                                        <?php $conn->use_result(); $result1 = $pachet->get_result(); ?>
                                            <td><table>
                                                <?php $row1 = $result1->fetch_assoc(); ?>
                                                <tr>
                                                    <?php foreach ($row1 as $collumn => $value): ?>
                                                        <th><?php echo $collumn; ?></th>
                                                    <?php endforeach; ?>
                                                </tr>
                                                <?php do { ?>
                                                <tr>
                                                    <?php foreach ($row1 as $collumn => $value): ?>
                                                        <td><?php echo $value;?></td>
                                                    <?php endforeach; ?>
                                                </tr>
                                                <?php } while($row1 = $result1->fetch_assoc()); ?>
                                            </table></td>
                                        <?php endif; ?>
                                <?php else: ?>
                                <td><?php echo $value;?></td>
                                <?php endif; ?>
                            <?php endforeach; ?>
                            <?php 
                                $oferta = $conn->prepare("SELECT * FROM oferte WHERE Pachet=?");
                                if($idPachet!=0) {
                                    $oferta->bind_param('i', $idPachet);
                                    if($oferta->execute()) {
                                        $conn->use_result(); $result2 = $oferta->get_result();
                                        if($result2) { ?>
                                            <td><table>
                                                <?php $row2 = $result2->fetch_assoc(); ?>
                                                <tr>
                                                    <?php foreach($row2 as $collumn => $value) { ?>
                                                        <th><?php echo $collumn ?></th>
                                                    <?php } ?>
                                                </tr>
                                                <?php do { ?>
                                                    <tr>
                                                    <?php foreach($row2 as $collumn => $value) { ?>
                                                        <td><?php echo $value ?></td>
                                                    <?php } ?>
                                                    </tr>
                                                    <?php } while($row2 = $result2->fetch_assoc()); ?>
                                            </table></td>
                                        <?php }
                                    }
                                }
                            ?>
                            </tr>
                        <?php } while($row = $result->fetch_assoc()); ?>
                        </table>
                        <?php $conn->commit(); ?>
                    <?php endif;
                    }
                }
            }
        } catch(Exception $e) { ?>
            <i><?php echo $e->getMessage(); ?></i>
        <?php } ?>
    <?php endif; ?>
    </div>
</body>
</html>