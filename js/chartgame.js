const valorantData = [12000, 12500, 13000, 13500, 14000, 14500, 15000, 15500, 16000, 16500, 17000, 17500];
const cs2Data = [15000, 15500, 16000, 16500, 17000, 17500, 18000, 18500, 19000, 19500, 20000, 20500];
const pubgData = [10000, 10500, 11000, 11500, 12000, 12500, 13000, 13500, 14000, 14500, 15000, 15500];
const apexData = [9000, 9500, 10000, 10500, 11000, 11500, 12000, 12500, 13000, 13500, 14000, 14500];
const codData = [8000, 8500, 9000, 9500, 10000, 10500, 11000, 11500, 12000, 12500, 13000, 13500];

function createChart(ctx, data) {
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Player Count',
                data: data,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

document.addEventListener('DOMContentLoaded', function () {
    createChart(document.getElementById('valorantChart').getContext('2d'), valorantData);
    createChart(document.getElementById('cs2Chart').getContext('2d'), cs2Data);
    createChart(document.getElementById('pubgChart').getContext('2d'), pubgData);
    createChart(document.getElementById('apexChart').getContext('2d'), apexData);
    createChart(document.getElementById('codChart').getContext('2d'), codData);

    document.getElementById('valorantCount').innerText = valorantData[valorantData.length - 1];
    document.getElementById('cs2Count').innerText = cs2Data[cs2Data.length - 1];
    document.getElementById('pubgCount').innerText = pubgData[pubgData.length - 1];
    document.getElementById('apexCount').innerText = apexData[apexData.length - 1];
    document.getElementById('codCount').innerText = codData[codData.length - 1];
});