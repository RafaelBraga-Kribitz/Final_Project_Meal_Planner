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

function initFileInput() {
    const fileInput = document.querySelector('.custom-file-input');
    const fileName = document.querySelector('.file-name');

    if (fileInput && fileName) {
        fileInput.addEventListener('change', () => {
            if (fileInput.files.length > 0) {
                fileName.textContent = fileInput.files[0].name;
            } else {
                fileName.textContent = 'No File Chosen';
            }
        });
    }
}

document.addEventListener('DOMContentLoaded', initFileInput);
document.addEventListener('turbo:load', initFileInput);


// ================= adding illumination type button by creating recipe start ===================

function activateRecipeTypeButtons() {
    const recipeTypeButtons = document.querySelectorAll('.recipe-types label.btn');
    const form = document.querySelector('form');

    if (!recipeTypeButtons || !form) return;

    recipeTypeButtons.forEach(button => {
        const input = button.querySelector('input[type="radio"]');

        if (input.checked) {
            button.classList.add('active');
        }

        input.addEventListener('change', () => {
            recipeTypeButtons.forEach(b => b.classList.remove('active'));
            if (input.checked) {
                button.classList.add('active');
            }
        });
    });

    form.addEventListener('submit', () => {
        recipeTypeButtons.forEach(button => button.classList.remove('active'));
    });
}

document.addEventListener('DOMContentLoaded', activateRecipeTypeButtons);
document.addEventListener('turbo:render', activateRecipeTypeButtons);
document.addEventListener('turbo:load', activateRecipeTypeButtons);


// ================= adding illumination type button by creating recipe end ===================



