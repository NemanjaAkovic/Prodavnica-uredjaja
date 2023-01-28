<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="style.css">
		<link rel="icon" type="image/x-icon" href="kolica.ico">
		<title>	Naruci </title>
	</head>
	
	<body>
	<div class="navbar">
        <a href="index.php">Početna strana</a>
        <a href="index.php#mobilniTelefoni">Mobilni telefoni</a>
        <a href="index.php#PCilaptopracunari">PC i laptop računari</a>
        <a href="index.php#pametniSatovi">Pametni satovi</a>
		<a href="index.php#informacije"> Informacije </a>
    </div>
	<main>
		<h1>
			Naručite uređaj:
		</h1>
		<table style="margin: auto; text-align:left;">
			<form method="POST">
				<tr>
					<td>
						Ime i prezime:
					</td>
					<td>
						<input type="text" name="imeiprezime" required>
					</td>
				</tr>
				<tr>
					<td>
						Adresa stanovanja:
					</td>
					<td>
						<input type="text" name="adresa" required>
					</td>
				</tr>
				<tr>
					<td>
						Broj telefona:
					</td>
					<td>
						<input type="text" name="brojtelefona" required>
					</td>
				</tr>
				<tr>
					<td>
						Šifra uređaja:
					</td>
					<td>
						<input type="text" name="sifrauredjaja" required>
					</td>
				</tr>
				<tr>
					<td>
						Način placanja:
					</td>
					<td>
						<input type="radio" name="nacinplacanja" value="Gotovina" required> Gotovina (prilikom preuzimanja)</input> <br>
						<input type="radio" name="nacinplacanja" value="Kartica" required> Kartica </input>
					</td>
				</tr>
				<tr>
					<td colspan='2' style='text-align:center'> 
						<input type="submit" name="submit" value="Potvrdi" class="submitButton">
					</td>
				</tr>
			</form>
		</table>
	</main>
		<?php
		include 'connect.php';
		if(isset($_POST['submit'])){
		
		$namesurname=mysqli_real_escape_string($conn,$_POST['imeiprezime']);
		$address=mysqli_real_escape_string($conn,$_POST['adresa']);
		$payingway=mysqli_real_escape_string($conn,$_POST['nacinplacanja']);	
		$gadget=mysqli_real_escape_string($conn,$_POST['sifrauredjaja']);
		$gadget=(int)$gadget;
		$telnumber=mysqli_real_escape_string($conn,$_POST['brojtelefona']);
		
		mysqli_query($conn,"INSERT INTO Korisnik(Ime_i_prezime,Adresa,Broj_telefona) VALUES ('$namesurname','$address','$telnumber');")
		or die ('query failed');
		
		mysqli_query($conn,"INSERT INTO Porudzbina(ID_korisnika) SELECT ID FROM Korisnik");		
		
		$date= DATE('d-m-y');
		mysqli_query($conn,"INSERT INTO Porudzbina(Datum_i_vrijeme,ID_korisnika,ID_uredjaja, Nacin_placanja) 
		VALUES ('$date',(SELECT ID FROM Korisnik WHERE Ime_i_prezime='$namesurname'),'$gadget','$payingway');")
		or die('query failed');
		
		echo "<p style='text-align: center'> Uspješno ste naručili uređaj: ";
		
		$resultAll = mysqli_query($conn, "SELECT Kategorija_proizvoda.Naziv, Uredjaji.Marka, Uredjaji.Model, Uredjaji.Cijena 
		FROM Uredjaji, Kategorija_proizvoda WHERE Uredjaji.ID='$gadget' AND Kategorija_proizvoda.ID=Uredjaji.Kategorija_Id");
		if(!$resultAll){
		die(mysqli_error($conn));
		}

		if (mysqli_num_rows($resultAll) > 0) {
			while($rowData = mysqli_fetch_array($resultAll)){
			echo $rowData["Marka"].' '.$rowData["Model"].' '.$rowData['Cijena'].'€, '.'iz kategorije: '.$rowData['Naziv'].'<br> </p>';
			}
		}
		echo "<p style='text-align:center'>Vaš uređaj stiže sa pet dana: ".Date('d.m.y',strtotime('+ 5 days')).". </p>";
	
	}
	?>
	</body>	
</html>

