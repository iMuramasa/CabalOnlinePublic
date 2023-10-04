<!doctype html>
<html lang="en-ru">
<head>
<meta charset="utf-8">
<title>Cabal Cooperative</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<?php
          require_once "./Connect/MssqlConnect.php";
		  $db = new MssqlConnect();
          $result = $db->fetch_all("SELECT SUM(WorldPoint) as TotalWorldPoint FROM CoopQuest.dbo.cabal_world_event_table");
          foreach ($result as $row) {
          $totalPoints = $row['TotalWorldPoint'];

          $result = $db->fetch_all("SELECT AwardGiven FROM CoopQuest.dbo.cabal_world_event_status where EventName = 'Global Reward 1'");
          foreach ($result as $row) {
		  $awardreward1 = $row['AwardGiven'];
}
          $result = $db->fetch_all("SELECT AwardGiven FROM CoopQuest.dbo.cabal_world_event_status where EventName = 'Global Reward 2'");
          foreach ($result as $row) {
	      $awardreward2 = $row['AwardGiven'];
}
          $result = $db->fetch_all("SELECT AwardGiven FROM CoopQuest.dbo.cabal_world_event_status where EventName = 'Global Reward 3'");
          foreach ($result as $row) {
	      $awardreward3 = $row['AwardGiven'];
}
          $result = $db->fetch_all("SELECT AwardGiven FROM CoopQuest.dbo.cabal_world_event_status where EventName = 'Global Reward 4'");
          foreach ($result as $row) {
	      $awardreward4 = $row['AwardGiven'];
}
          $result = $db->fetch_all("SELECT AwardGiven FROM CoopQuest.dbo.cabal_world_event_status where EventName = 'Global Reward 5'");
          foreach ($result as $row) {
	      $awardreward5 = $row['AwardGiven'];
}
?>
<h1 class="time-start">Event Data: 2023.04.14-2023.05.14 </h1>
<div class="main">
	<a href="http://cabalclose" class="close">X</a> <!--Кнопки-->
	<a href="http://localhost/table.php" class="quest">☠️</a><!--Кнопки-->
	<button class="Modal" onclick="openPopup()">🔔</button><!--Кнопки-->
	<section id="slider" class="pt-5">
  <div class="container">
<h1 class="text-center"><b>Cooperative Rewards</b></h1>
	  <!--Всплывающее окно-->
	  <div class="overlay" style="display:none;"> <!-- Элемент всплывающего окна -->
		  <div class="popup">
			  <center><h5>Кооперативный Ивент: информация</h5></center>
			  <p>1) Где можно получить очки, можно узнать здесь ->> <a class="info-event" href="table.php">☠️</a></p>
			  <p>2) Когда очки достигнут необходимого количества, будет выдана награда, а счетчик очков обнулится, и отчет начнется заново.</p>
			  <p>3) Награда выдаеться всем пользователям учавствовавшим в ивенте.</p>
			  <p>4) У пользователя, у которого меньше 10 очков, не будет награды.</p>
			  <p>5) Это серверный ивент, учавствует весь сервер.'.</p>
			  <p>6) Награда будет выдана на аккаунт независимо от используемого персонажа, так как очки считаются общими.</p>
			  <center><h5>Правила</h5></center>
			  <p>1) Запрещено использовать более одного аккаунта. При обнаружении такого нарушения, аккаунт будет заблокирован на 7/14/30/365 дней, а награды будут удалены.</p>
			  <button class="close-modal" onclick="closePopup()">Close</button>
		  </div>
	  </div>
	  <script>
		  function openPopup() {
			  document.querySelector('.overlay').style.display = 'flex'; // открытие окна при клике на кнопку
		  }

		  function closePopup() {
			  document.querySelector('.overlay').style.display = 'none'; // закрытие окна при клике на кнопку
		  }
	  </script>
	  <!--Всплывающее окно-->


	  <!--Слайдер-->
	  <div class="slider">
				<div class="carousel">
					<!--Reward 100 point-->
					<?php if ($awardreward1 >= 1) { ?>
				     	<div class="card">
						<h5 class="text-center"></h5>
						<img src="../img/chest1G.png" alt="1" title="Rewards:
1)Potion of Wexp (10k)
2)Potion of Luck (1b)
3)Enchant Core (High)

"/>
					</div>
					<?php } else { ?>
						<div class="card">
							<h5 class="text-center">100 Points</h5>
							<img src="../img/chest1.png" alt="1" title="Rewards:
1)Potion of Wexp (10k)
2)Potion of Luck (1b)
3)Enchant Core (High)
"/>
				     	</div>
					<?php } ?>
					<!--Reward 300 point-->
					<?php if ($awardreward2 >= 1) { ?>
						<div class="card">
							<h5 class="text-center"></h5>
							<img src="../img/chest2G.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } else { ?>
						<div class="card">
							<h5 class="text-center">300 Points</h5>
							<img src="../img/chest2.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } ?>
					<!--Reward 500 point-->
					<?php if ($awardreward3 >= 1) { ?>
						<div class="card">
							<h5 class="text-center"></h5>
							<img src="../img/chest3G.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } else { ?>
						<div class="card">
							<h5 class="text-center">500 Points</h5>
							<img src="../img/chest3.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } ?>
					<!--Reward 1k point-->
					<?php if ($awardreward4 >= 1) { ?>
						<div class="card">
							<h5 class="text-center"></h5>
							<img src="../img/chest4G.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } else { ?>
						<div class="card">
							<h5 class="text-center">1000 Points</h5>
							<img src="../img/chest4.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } ?>
					<!--Reward 3k point-->
					<?php if ($awardreward5 >= 1) { ?>
						<div class="card">
							<h5 class="text-center"></h5>
							<img src="../img/chest5G.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } else { ?>
						<div class="card">
							<h5 class="text-center">3000 Points</h5>
							<img src="../img/chest5.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } ?>
					<!--Reward 5k point-->
					<?php if ($totalPoints >= 5000) { ?>
						<div class="card">
							<h5 class="text-center"></h5>
							<img src="../img/chest6G.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
					<?php } else { ?>
						<div class="card">
							<h5 class="text-center">5000 Points</h5>
							<img src="../img/chest6.png" alt="1" title="Rewards:
1)Wexp x1000
2)Alz x1000
3)Yul Amulet +8 (3-Day)
4)Pet Alpaca
5)Wing Exp x100
"/>
						</div>
				</div>
					<?php } ?>
		  <!--Слайдер-->
		  <!--Прогресс Очков-->
		  <?php
			  echo "<div class='progress'>";
			  echo "<p>Points: {$totalPoints}</p>";
			  echo "</div>";
		  }
		  ?>
		  <!--Прогресс Очков-->

		  <!--Подвал-->
	 <section> <div id="footer_page" class="footer_page">&copy; ProjectSirius Author Muramasa</div></section>
		  <!--Подвал-->

		               <!--Скрипты-->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" ></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/script.js"></script>
		               <!--Скрипты-->
</body>
</html>
