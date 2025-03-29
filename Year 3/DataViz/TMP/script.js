function openModal(chartId) {
    document.getElementById("modal").style.display = "block";
    document.getElementById("modal-iframe").src = "charts/" + chartId + ".html";
}

function closeModal() {
    document.getElementById("modal").style.display = "none";
}
