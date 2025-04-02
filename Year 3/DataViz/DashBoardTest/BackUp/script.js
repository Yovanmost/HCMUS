// Add event listeners to all .chart-box elements
document.querySelectorAll('.chart-box').forEach(box => {
    box.addEventListener('click', function () {
        const chartId = this.getAttribute('data-chart-id'); // Get chart ID
        openModal(chartId);
    });
});

function openModal(chartId) {
    const modal = document.getElementById("modal");
    const modalIframe = document.getElementById("modal-iframe");

    modal.style.display = "block";
    modalIframe.src = "charts/" + chartId + ".html";

    // Reset iframe scaling for full-size display
    modalIframe.style.width = "100%";
    modalIframe.style.height = "100%";
    modalIframe.style.transform = "scale(1)";
}

function closeModal() {
    document.getElementById("modal").style.display = "none";
    document.getElementById("modal-iframe").src = ""; // Reset iframe to prevent loading issues
}
