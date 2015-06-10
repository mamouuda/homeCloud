<%@page import="java.util.ArrayList"%>
<%@page import="de.cynapsys.home.entity.House"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory
            .getBlobstoreService();
%>

<!DOCTYPE html>
<html>
<head>
<title>HomeAutomation Administration</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../stylesheets/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="../stylesheets/css/style.css" rel="stylesheet"
	media="screen">

<script type="text/javascript">



	
	function deletehouse(stringkey) {
		if (confirm('voulez vous supprimer le domicile ?')) {

			$.ajax({
				url : "deleteservlet/",
				type : "POST",
				data : {
					key : stringkey
				},
				success : function(data, textStatus, jqXHR) {

				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});

		} else {
		}
	}

	function showDetails(id, City, Country, Name, StreetAdress, Webservice,
			Zip, User, url,firstname,lastname,login,mailuser,iduser,urluser) {

		$("#imgDetail").attr("src", url);
		$("#imgDetail").css("max-width", "150px");
		$("#imgDetail").css("border", "1px");
		$("#nameDetail").val(Name);
		$("#streetDetail").val(StreetAdress);
		$("#cityDetail").val(City);
		$("#countryDetail").val(Country);
		$("#zipDetail").val(Zip);
		$("#webserviceDetail").val(Webservice);
		$("#idDetail").text(id);
		
		
		$("#imguserDetail").attr("src", urluser);
		$("#imguserDetail").css("max-width", "150px");
		$("#imguserDetail").css("border", "1px");
		
		$("#firstnameuserDetail").val(firstname);
		$("#lastnameuserDetail").val(lastname);
		$("#loginuserDetail").val(login);
		$("#iduserDetail").text(iduser);
                $("#mailuserDetail").val(mailuser);
		

	}

	function savechanges() {

		alert("id: " + $("#idDetail").text() + "City: "
				+ $("#cityDetail").val() + "Country: "
				+ $("#countryDetail").val() + "Name: " + $("#nameDetail").val()
				+ "StreetAdress: " + $("#streetDetail").val() + "Webservice: "
				+ $("#webserviceDetail").val() + "Zip: "
				+ $("#zipDetail").val());

		$.ajax({
			url : "showdetailservlet/",
			type : "POST",
			data : {
				id : $("#idDetail").text(),
				City : $("#cityDetail").val(),
				Country : $("#countryDetail").val(),
				Name : $("#nameDetail").val(),
				StreetAdress : $("#streetDetail").val(),
				Webservice : $("#webserviceDetail").val(),
				Zip : $("#zipDetail").val()
			},
			success : function(data, textStatus, jqXHR) {

			},
			error : function(jqXHR, textStatus, errorThrown) {

			}
		});
	}

	function connect() {
		url = $("#webserviceDetail").val();
		alert("http://" + url
				+ "/HomeAutomationHibernate/jsfpages/category.jsf");
		window.location.replace("http://" + url
				+ "/HomeAutomationHibernate/jsfpages/category.jsf");
	}
</script>
</head>
<body>

	<div class="container-narrow">

		<div class="masthead">
			<ul class="nav nav-pills pull-right">
				<li class="active"><a href="/">Accueil</a></li>
				<li><a href="#list">Liste des maisons</a></li>
				<li><a href="#upload">Ajouter</a></li>
			</ul>
			<h3 class="muted">HomeAutomation Administration</h3>
		</div>

		<hr />

		<div class="jumbotron">
			<h1>
				HomeAutomation<br />
			</h1>

			<a class="btn btn-large btn-success" href="#upload">Ajouter une
				maison</a>
		</div>

		<hr />

		<div class="row-fluid iconlist" id="list">

			<h2>Liste des maisons</h2>

			<p>
				Filtrer par nom : <input type="text" name="filter" />
			</p>

			<%
				List<House> uploads = (List<House>) request.getAttribute("uploads");
				if (uploads == null) {
					uploads = new ArrayList<House>();
				}

				if (uploads.size() == 0) {
			%>

			<p>
				<em>Aucune maison ajoutée</em>
			</p>

			<%
				} else {
					int i = 0;
					for (House upload : uploads) {
						if ((i % 3) == 0) {
			%>
			<div class="row">
				<%
					}
				%>

				<div class="span4">
					<figure>
						<img src="<%=upload.getUrl()%>" alt="Image utilisateur"
							data-toggle="modal" data-target="#myModal"
							class="img-polaroid photo"
							style="max-width: 100px; cursor: pointer;"
							onclick="showDetails('<%=upload.getId()%>','<%=upload.getCity()%>','<%=upload.getCountry()%>','<%=upload.getName()%>',
													'<%=upload.getStreetAdress()%>','<%=upload.getWebservice()%>',
													'<%=upload.getZip()%>','<%=upload.getUser()%>','<%=upload.getUrl()%>',
													'<%=upload.getuserHouse().getFirstName()%>','<%=upload.getuserHouse().getLastName()%>',
													'<%=upload.getuserHouse().getLogin()%>','<%=upload.getuserHouse().getMail()%>',
													'<%=upload.getuserHouse().getId()%>','<%=upload.getuserHouse().getUrl()%>');" />
						<figcaption>
							<a class="close" href=""
								onclick="deletehouse('<%=upload.getKey().getKeyString()%>');">&times;</a>
							<%=upload.getName()%>
							<%=upload.getCountry()%>
							<%=upload.getCity()%></figcaption>
					</figure>
				</div>

				<%
					if ((i % 3) == 2 || i == uploads.size() - 1) {
				%>
			</div>
			<%
				}
						i++;
					}
				}
			%>

		</div>

		<hr />

		<div class="row-fluid iconlist" id="upload">

			<center>
				<h2>Ajouter une maison</h2>
			</center>

		</div>

	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">details du domicile</h4>
				</div>
				<div class="modal-body">

					<table id="tableDetail" style="float: left; width: 40%;">
						<tr>
							<td>Image :</td>
							<td><img id="imgDetail" src="" alt="" /><br />
							<input type="file" name="uploadedFile" /></td>
						</tr>

						<tr>
							<td>id :</td>
							<td><label id="idDetail" style="color: gray;"></label></td>
						</tr>

						<tr>
							<td>nom :</td>
							<td><input type="text" name="name" id="nameDetail" /></td>
						</tr>

						<tr>
							<td>Rue :</td>
							<td><input type="text" name="street" id="streetDetail" /></td>
						</tr>

						<tr>
							<td>ville :</td>
							<td><input type="text" name="city" id="cityDetail" /></td>
						</tr>

						<tr>
							<td>pays :</td>
							<td><input type="text" name="country" id="countryDetail" /></td>
						</tr>

						<tr>
							<td>code postale :</td>
							<td><input type="text" name="zip" id="zipDetail" /></td>
						</tr>

						<tr>
							<td>URL web service :</td>
							<td><input type="text" name="webservice"
								id="webserviceDetail" /></td>
						</tr>


					</table>
					
					<table id="tableDetailUser"  style="float: right; width: 44%;">
						<tr>
							<td>Image :</td>
							<td><img id="imguserDetail" src="" alt="" /><br />
							<input type="file" name="uploadedFile" /></td>
						</tr>

						<tr>
							<td>id :</td>
							<td><label id="iduserDetail" style="color: gray;"></label></td>
						</tr>

						<tr>
							<td>nom :</td>
							<td>
							<input type="text" name="firstnameuser" id="firstnameuserDetail"
										class="form-control" /></td>

						</tr>

						<tr>
							<td>Prénom :</td>
							<td><input type="text" name="lastnameuser" id="lastnameuserDetail"
										class="form-control"/></td>
						</tr>
                                                
                                                <tr>
							<td>E-mail :</td>
							<td><input type="text" name="mail" id="mailuserDetail"
										class="form-control"/></td>
						</tr>

						<tr>
							<td>Login :</td>
							<td><input type="text" name="loginuser" id="loginuserDetail"
										class="form-control"/></td>
						</tr>

						
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
					<button type="button" class="btn btn-primary"
						onclick="savechanges()">Sauvgarder</button>
					<button type="button" class="btn btn-success" onclick="connect()">Connecter</button>
				</div>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="stepwizard">
			<div class="stepwizard-row setup-panel">

				<div class="stepwizard-step">
					<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
					<p>domicile</p>
				</div>

				<div class="stepwizard-step">
					<a href="#step-2" type="button" class="btn btn-default btn-circle"
						disabled="disabled">2</a>
					<p>utilisateur</p>
				</div>

			</div>
		</div>

		<form action='<%=blobstoreService.createUploadUrl("/admin/")%>'
			method="post" enctype="multipart/form-data"
			class="form-horizontal col-lg-12">

			<div class="row setup-content" id="step-1">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Domicile</h3>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">Image :</label>
								<div class="col-lg-10">
									<input type="file" name="uploadedFile" required="required"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">nom :</label>
								<div class="col-lg-10">
									<input type="text" name="name" required="required"
										class="form-control" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">Rue :</label>
								<div class="col-lg-10">
									<input type="text" name="street" class="form-control" required="required"
										/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">ville :</label>
								<div class="col-lg-10">
									<input type="text" name="city" class="form-control" required="required"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">pays :</label>
								<div class="col-lg-10">
									<input type="text" name="country" class="form-control" required="required"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">code postale :</label>
								<div class="col-lg-10">
									<input type="text" name="zip" class="form-control" required="required"/>
								</div>
							</div>
						</div>
                                                
                                                
                                                

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">URL web service :</label>
								<div class="col-lg-10">
									<input type="text" name="webservice" class="form-control" required="required"/>
								</div>
							</div>
						</div>

						<button class="btn btn-primary nextBtn btn-lg pull-right"
							type="button">ajouter utilisateur >></button>
					</div>
				</div>
			</div>

			<div class="row setup-content" id="step-2">
				<div class="col-xs-12">
					<div class="col-md-12">
						<h3>Utilisateur</h3>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">Image :</label>
								<div class="col-lg-10">
									<input type="file" name="uploadedFileuser" required="required"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label ">Nom :</label>
								<div class="col-lg-10">
									<input type="text" name="firstnameuser" required="required"
										class="form-control" placeholder="Entrer le nom" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="control-label">Prénom :</label>
								<div class="col-lg-10">
									<input type="text" name="lastnameuser" required="required"
										class="form-control" placeholder="Entrer le prénom" />
								</div>
							</div>
						</div>
                                                
                                                <div class="row">
							<div class="form-group">
								<label class="col-lg-2 control-label">E-mail :</label>
								<div class="col-lg-10">
									<input type="text" name="emailuser" class="form-control" required="required"
                                                                               placeholder="Entrer l'email"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="control-label ">Login :</label>
								<div class="col-lg-10">
									<input type="text" name="loginuser" required="required"
										class="form-control" placeholder="Entrer le login" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="control-label">Mot de passe :</label>
								<div class="col-lg-10">
									<input type="text" name="passworduser" required="required"
										class="form-control" placeholder="Enter le mot de passe" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<label class="control-label">Retaper mot de passe :</label>
								<div class="col-lg-10">
									<input type="text" name="rpassworduser" required="required"
										class="form-control" placeholder="Retaper le mot de passe" />
								</div>
							</div>
						</div>
                                                
                                                

						<button class="btn btn-success btn-lg pull-right" type="submit">Enregistrer</button>
					</div>
				</div>
			</div>

		</form>
	</div>

	<script src="../stylesheets/js/jquery-1.11.3.js" type="text/javascript"></script>
	<script src="../stylesheets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../stylesheets/js/train.js" type="text/javascript"></script>
</body>
</html>
