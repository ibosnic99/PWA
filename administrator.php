<?php
session_start();


if (!isset($_SESSION['username']) || !$_SESSION['is_admin']) {
    header("Location: login.php"); 
    exit();
}


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "baza";


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete_article'])) {
    $article_id = $_POST['article_id'];

    $stmt = $conn->prepare("DELETE FROM news WHERE id = ?");
    $stmt->bind_param("i", $article_id);
    if ($stmt->execute()) {
        echo "<script>alert('Article deleted successfully.')</script>";
    } else {
        echo "<script>alert('Error deleting article: " . $conn->error . "')</script>";
    }
    $stmt->close();
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['edit_article'])) {
    $article_id = $_POST['article_id'];
    $title = $_POST['title'];
    $category = $_POST['category'];
    $content = $_POST['content'];

    $stmt = $conn->prepare("UPDATE news SET title = ?, category = ?, content = ? WHERE id = ?");
    $stmt->bind_param("sssi", $title, $category, $content, $article_id);
    if ($stmt->execute()) {
        echo "<script>alert('Article updated successfully.')</script>";
    } else {
        echo "<script>alert('Error updating article: " . $conn->error . "')</script>";
    }
    $stmt->close();
}

$edit_mode = false;
if (isset($_GET['edit'])) {
    $article_id = $_GET['edit'];

    $stmt = $conn->prepare("SELECT id, title, category, content FROM news WHERE id = ?");
    $stmt->bind_param("i", $article_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $title = $row['title'];
        $category = $row['category'];
        $content = $row['content'];
        $edit_mode = true;
    } else {
        echo "<script>alert('Article not found.')</script>";
    }
    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Panel - Manage Articles</title>
    <link rel="stylesheet" href="css/styles.css"> 
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
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
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="administrator.php">Admin Panel</a></li>
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
                        <h1>News Portal - Admin Panel</h1>
                        <span class="subheading">Manage News Articles</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <section id="manage_articles">
                    <?php if ($edit_mode): ?>
                        <h2>Edit Article</h2>
                        <form method="post" action="administrator.php">
                            <input type="hidden" name="article_id" value="<?= $article_id ?>">
                            <label for="title">Title:</label><br>
                            <input type="text" id="title" name="title" value="<?= htmlspecialchars($title) ?>"><br><br>
                            <label for="category">Category:</label><br>
                            <input type="text" id="category" name="category" value="<?= htmlspecialchars($category) ?>"><br><br>
                            <label for="content">Content:</label><br>
                            <textarea id="content" name="content"><?= htmlspecialchars($content) ?></textarea><br><br>
                            <button type="submit" name="edit_article">Save Changes</button>
                        </form>
                    <?php else: ?>
                        <h2>Manage News Articles</h2>
                        <?php
                        $sql = "SELECT id, title, category FROM news";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            echo "<table>";
                            echo "<tr><th>Title</th><th>Category</th><th>Action</th></tr>";
                            while ($row = $result->fetch_assoc()) {
                                echo "<tr>";
                                echo "<td>" . htmlspecialchars($row['title']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['category']) . "</td>";
                                echo "<td>";
                                echo "<form method='post' action='administrator.php' style='display:inline;'>";
                                echo "<input type='hidden' name='article_id' value='" . $row['id'] . "'>";
                                echo "<button type='submit' name='delete_article'>Delete</button>";
                                echo "</form>";
                                echo " | <a href='administrator.php?edit=" . $row['id'] . "'>Edit</a>";
                                echo "</td>";
                                echo "</tr>";
                            }
                            echo "</table>";
                        } else {
                            echo "<p>No articles found.</p>";
                        }
                        ?>
                    <?php endif; ?>
                </section>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2
