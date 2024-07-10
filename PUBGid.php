<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>PUBG</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/jogreen.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets2/css/style.css" rel="stylesheet">

  <!-- ApexCharts CSS and JS -->
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>

<body>>

<?php include 'sidebar.html'; ?>

<div class="content">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Ask About Player Stats</h5>
          <form method="post">
            <label for="question" class="col-sm-2 col-form-label">Question:</label>
            <input type="text" id="question" name="question" class="form-control" required>
            <br><br>
            <input type="submit" class="btn btn-primary" value="Submit">
          </form>
          <?php
            require __DIR__ . '/vendor/autoload.php';

            use LucianoTonet\GroqPHP\Groq;
            use Dotenv\Dotenv;
            use GuzzleHttp\Client;

            class QueryHandler {
                private $groq;
                private $client;
                private $conn;
                private $apiKey;

                public function __construct() {
                    $config = require __DIR__ . '/config.php'; // Load the configuration file
                    $this->apiKey = $config['groq_api_key'];
                    $this->groq = new Groq($this->apiKey);
                    $this->client = new Client();
                    $this->conn = new mysqli('localhost', 'root', '', 'jago3'); // Database connection

                    if ($this->conn->connect_error) {
                        error_log("Connection failed: " . $this->conn->connect_error);
                    }
                }

                public function handleQuery($user_question) {
                    // SQL query to fetch data from Battlefield1 table
                    $sql = "SELECT player_name, win, winrate, kills, headshot_percentage, weapon_used, mvp, overall_total_score FROM pubg";

                    $result = $this->conn->query($sql);

                    $data = array();
                    if ($result->num_rows > 0) {
                        // Collect query results into an associative array
                        while ($row = $result->fetch_assoc()) {
                            $data[] = $row;
                        }
                    }

                    // Further process the data, e.g., for use with GroqPHP
                    if (!empty($data)) {
                        $system_content = "You are an AI that only answers questions about player stats, performance, and related topics.";
                        foreach ($data as $item) {
                            $system_content .= "Player: " . $item['player_name'] . ", Wins: " . $item['win'] . ", Winrate: " . $item['winrate'] . ", Kills: " . $item['kills'] . ", Headshot Percentage: " . $item['headshot_percentage'] . ", Weapon Used: " . $item['weapon_used'] . ", MVP: " . $item['mvp'] . ", Overall Total Score: " . $item['overall_total_score'] . "; ";
                        }

                        $chatCompletion = $this->groq->chat()->completions()->create([
                            'model' => 'llama3-70b-8192', // Ensure this model ID is correct
                            'messages' => [
                                [
                                    'role' => 'system',
                                    'content' => 'You are an assistant and analysis expert who provides recommendations based on the user\'s data and the data I provide. And also give a short summary of the answer' . $system_content
                                ],
                                [
                                    'role' => 'user',
                                    'content' => $user_question
                                ]
                            ]
                        ]);

                        if (!is_null($chatCompletion)) {
                            $answer = $chatCompletion['choices'][0]['message']['content'];
                            // Log the response from the LLM
                            $formatted_answer = preg_replace('/([.?!])\s*/', '$1<br>', $answer);
                            error_log("LLM response: " . $formatted_answer);
                            return $formatted_answer;
                        } else {
                            error_log("LLM returned null response.");
                            return 'Something went wrong.';
                        }
                    } else {
                        return 'No data found.';
                    }
             }

            public function getFAQs() {
              // SQL query to fetch FAQs from the database
              $sql = "SELECT question, frequency FROM faqs ORDER BY frequency DESC LIMIT 5"; // Example query to get top 5 FAQs
              $result = $this->conn->query($sql);

              $faqs = array();
              if ($result->num_rows > 0) {
                  // Collect FAQ results into an associative array
                  while ($row = $result->fetch_assoc()) {
                      $faqs[] = $row;
                  }
              }
              return $faqs;
          }
        }

       $queryHandler = new QueryHandler();

            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $queryHandler = new QueryHandler();
                $user_question = $_POST['question'];
                $answer = $queryHandler->handleQuery($user_question);

                echo "<br><br>";
                echo "<h4>AI Response</h4>";
                echo "<p>$answer</p>";
            }
          ?>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title"> The Most Frequently Asked Questions</h5>
          <ul>
            <?php
              $faqs = $queryHandler->getFAQs();
              if (!empty($faqs)) {
                  foreach ($faqs as $faq) {
                      echo "<li><strong>Q: " . $faq['question'] . "</strong><br>Total who asked: " . $faq['frequency'] . "</li><br>";
                  }
              } else {
                  echo "<li>No FAQs available at the moment.</li>";
              }
            ?>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Filtering Player Based on Weapon</h5>

          <!-- Filters -->
          <div>
            <label for="weaponFilter">Weapon:</label>
            <select id="weaponFilter">
              <option value="all">All</option>
              <option value="Pistol">Pistol</option>
              <option value="Sniper">Sniper</option>
              <option value="Melee">Melee</option>
              <option value="Rifle">Rifle</option>
              <option value="SMG">SMG</option>
            </select>

            <label for="statFilter">Statistic:</label>
            <select id="statFilter">
              <option value="win">Wins</option>
              <option value="winrate">Winrate</option>
              <option value="kills">Kills</option>
              <option value="headshot_percentage">Headshot Accuracy</option>
              <option value="mvp">MVP</option>
            </select>
          </div>

          <!-- Bar Chart -->
          <div id="barChart"></div>

          <script>
            document.addEventListener("DOMContentLoaded", () => {
              let currentChart = null;

              const renderChart = () => {
                const weapon = document.getElementById('weaponFilter').value;
                const stat = document.getElementById('statFilter').value;

                const params = new URLSearchParams({ weapon, stat });
                fetch(`fetch_data_pubg.php?${params.toString()}`)
                  .then(response => response.json())
                  .then(data => {
                    const categories = data.map(item => item.player_name);
                    const seriesData = data.map(item => parseFloat(item[stat]));

                    if (currentChart) {
                      currentChart.destroy();
                    }

                    currentChart = new ApexCharts(document.querySelector("#barChart"), {
                      series: [{
                        data: seriesData
                      }],
                      chart: {
                        type: 'bar',
                        height: 350
                      },
                      plotOptions: {
                        bar: {
                          borderRadius: 4,
                          horizontal: false,
                        }
                      },
                      dataLabels: {
                        enabled: false
                      },
                      xaxis: {
                        categories: categories,
                        title: {
                          text: 'Player'
                        }
                      },
                      yaxis: {
                        title: {
                          text: stat.charAt(0).toUpperCase() + stat.slice(1)
                        }
                      }
                    });

                    currentChart.render();
                  });
              };

              document.getElementById('weaponFilter').addEventListener('change', renderChart);
              document.getElementById('statFilter').addEventListener('change', renderChart);

              renderChart();
            });
          </script>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">PUBG Player Statistic Table in Detail</h5>
          <table class="table datatable">
            <div class="datatable-dropdown">
              <?php
                // Replace with your database connection details
                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "jago3";

                // Create connection
                $conn = new mysqli($servername, $username, $password, $dbname);

                // Check connection
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Fetch player stats
                $sql = "SELECT player_name, win, winrate, kills, headshot_percentage, weapon_used, mvp, overall_total_score FROM PUBG";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    echo '<table class="table datatable"><thead><tr><th scope="col">Player Name</th><th scope="col">Wins</th><th scope="col">Winrate</th><th scope="col">Kills</th><th scope="col">Headshot Percentage</th><th scope="col">Weapon Used</th><th scope="col">MVP</th><th scope="col">Overall Total Score</th></tr></thead><tbody>';

                    while ($row = $result->fetch_assoc()) {
                        echo '<tr><td>' . $row["player_name"] . '</td><td>' . $row["win"] . '</td><td>' . $row["winrate"] . '</td><td>' . $row["kills"] . '</td><td>' . $row["headshot_percentage"] . '</td><td>' . $row["weapon_used"] . '</td><td>' . $row["mvp"] . '</td><td>' . $row["overall_total_score"] . '</td></tr>';
                    }

                    echo '</tbody></table>';
                } else {
                    echo "0 results";
                }

                $conn->close();
              ?>
            </div>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

</html>
