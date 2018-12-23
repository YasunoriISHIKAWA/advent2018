<?php
// Load our autoloader
require_once __DIR__.'/vendor/autoload.php';

// Specify our Twig templates location
$loader = new Twig_Loader_Filesystem(__DIR__.'/templates');

// Instantiate our Twig
$twig = new Twig_Environment($loader);

$dbh = new PDO('pgsql:host=my-release-cockroachdb-public;port=26257;dbname=line;sslmode=disable',
    'maxroach', null, array(
        PDO::ATTR_ERRMODE          => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => true,
    ));

$stations = $dbh->query('SELECT id, name FROM yamanote_line ORDER BY id ASC');

// Render our view
echo $twig->render('index.html', ['stations' => $stations] );
