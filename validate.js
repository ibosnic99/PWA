document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("newsForm");
    form.addEventListener("submit", function(event) {
        let valid = true;

        const title = document.getElementById("title");
        const summary = document.getElementById("summary");
        const content = document.getElementById("content");
        const image = document.getElementById("image");
        const category = document.getElementById("category");

        if (title.value.length < 5 || title.value.length > 30) {
            valid = false;
            title.classList.add("error");
            document.getElementById("titleError").textContent = "Title must be between 5 and 30 characters.";
        } else {
            title.classList.remove("error");
            document.getElementById("titleError").textContent = "";
        }

        if (summary.value.length < 10 || summary.value.length > 100) {
            valid = false;
            summary.classList.add("error");
            document.getElementById("summaryError").textContent = "Summary must be between 10 and 100 characters.";
        } else {
            summary.classList.remove("error");
            document.getElementById("summaryError").textContent = "";
        }

        if (content.value.trim() === "") {
            valid = false;
            content.classList.add("error");
            document.getElementById("contentError").textContent = "Content cannot be empty.";
        } else {
            content.classList.remove("error");
            document.getElementById("contentError").textContent = "";
        }

        if (image.files.length === 0) {
            valid = false;
            image.classList.add("error");
            document.getElementById("imageError").textContent = "You must select an image.";
        } else {
            image.classList.remove("error");
            document.getElementById("imageError").textContent = "";
        }

        if (category.value === "") {
            valid = false;
            category.classList.add("error");
            document.getElementById("categoryError").textContent = "You must select a category.";
        } else {
            category.classList.remove("error");
            document.getElementById("categoryError").textContent = "";
        }

        if (!valid) {
            event.preventDefault();
        }
    });
});
