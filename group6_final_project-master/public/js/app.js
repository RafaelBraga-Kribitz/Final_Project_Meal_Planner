document.addEventListener("turbo:load", () => {
    const alerts = document.querySelectorAll(".alert");

    alerts.forEach((alert) => {
        setTimeout(() => {
            alert.classList.add("fade-out");
        setTimeout(() => {
                alert.remove();
            }, 500);
        }, 5000);
    });
});


// ===============================================

document.addEventListener('DOMContentLoaded', () => {
    const fileInput = document.querySelector('.custom-file-input');
    const fileName = document.querySelector('.file-name');

    fileInput.addEventListener('change', () => {
        if (fileInput.files.length > 0) {
            fileName.textContent = fileInput.files[0].name;
        } else {
            fileName.textContent = 'No File Chosen';
        }
    });
});

