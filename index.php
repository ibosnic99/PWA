<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "baza";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM news WHERE archived = 0";
$result = $conn->query($sql);

$articles = [
    'Sport' => [],
    'Culture' => []
];

while ($row = $result->fetch_assoc()) {
    if ($row['category'] === 'sport') {
        $articles['Sport'][] = $row;
    } elseif ($row['category'] === 'culture') {
        $articles['Culture'][] = $row;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Welt</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" />
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.php">Welt</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.php">Home</a></li>
                    <?php if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']): ?>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="unos.html">New article</a></li>
                    <?php endif; ?>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="kategorija.php?category=sport">Sport</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="kategorija.php?category=culture">Culture</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="administrator.php">Admin</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="registracija.php">Register</a></li>
                    <?php if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']): ?>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="logout.php">Logout</a></li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </nav>

    <header class="masthead" style="background-image: url('assets/img/home-bg2.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>Welt</h1>
                        <span class="subheading">Latest News</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <?php foreach ($articles as $category => $posts): ?>
                    <h2 class="category-title"><?= htmlspecialchars($category) ?></h2>
                    <?php foreach ($posts as $post): ?>
                        <div class="post-preview">
                            <?php if (!empty($post['image'])): ?>
                                <a href="clanak.php?id=<?= $post['id'] ?>">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="<?= htmlspecialchars($post['image']) ?>" alt="<?= htmlspecialchars($post['title']) ?>" class="img-fluid">
                                        </div>
                                        <div class="col-md-8">
                                            <h2 class="post-title"><?= htmlspecialchars($post['title']) ?></h2>
                                            <h3 class="post-subtitle"><?= htmlspecialchars($post['summary']) ?></h3>
                                        </div>
                                    </div>
                                </a>
                            <?php else: ?>
                                <a href="clanak.php?id=<?= $post['id'] ?>">
                                    <h2 class="post-title"><?= htmlspecialchars($post['title']) ?></h2>
                                    <h3 class="post-subtitle"><?= htmlspecialchars($post['summary']) ?></h3>
                                </a>
                            <?php endif; ?>
                        </div>
                        <hr class="my-4" />
                    <?php endforeach; ?>
                <?php endforeach; ?>
                
            </div>
        </div>
    </div>

    <footer class="border-top">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="small text-center text-muted fst-italic">&copy; 2024 News Portal</div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
