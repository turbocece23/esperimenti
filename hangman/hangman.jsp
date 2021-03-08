<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "java.text.*" %>

<%
	// Pool di parole da cui il programma sceglie
	String[] pool 			= new String[] {"interludio", "fusibile", "turbocompressore", "sassofono", "aiuola", "motorsport", "badile", "mamma", "compartimento"};
	String indiceStringa; 				//Variabile che uso per contenere temporaneamente la stringa dell'indice presa dalla richiesta GET
	String tentativi 		= "";		//Stringa che contiene le lettere inserite come tentativi
	boolean unalettera		= true;		//Variabile booleana che controlla se l'utente ha inserito una lettera o una parola
	String stringaGuess		= "";		//Stringa in caso l'utente abbia inserito una parola enon una sola letera
	boolean primoAvvio		= true;		//Variabile booleana che controlla se è il "primo avvio" della pagina, viene messa a false se tutte le variabili GET sono impostate a NULL

	boolean trovata			= false;	//Flag che controlla se la lettera è stata trovata o no
	boolean finita			= true;		//Flag che controlla che la stringa sia composta di sole lettere e non underscore

	int indice;							//Indice della posizione della parola
	char lettera;						//Char che conterrà il carattere usato per il confronto

	//Se l'utente desidera cambiare parola
	if(request.getParameter("nuovaParola") != null) {
		//Prendi l'indice dalla richiesta get
		indice = Integer.parseInt(request.getParameter("indiceGET"));
		//Svuota i tentativi
		tentativi = "";
		//Se il carattere inserito e passato in GET esiste
		lettera = ' ';
	} else {
		//Altrimenti se l'utente sta continuando una partita già in corso
		//prendi i tentativi
		tentativi = request.getParameter("tentativiGET");
		//Controlla che esista il parametro dell'indice in GET
		if(request.getParameter("indiceGET") == null) {
			//Se non esiste impostane uno nuovo random
			Random ran = new Random();
			indice = ran.nextInt(pool.length);
		} else {
			//Altrimenti, prendilo e usalo inserendolo in indice
			indiceStringa = request.getParameter("indiceGET");
			indice = Integer.parseInt(indiceStringa);
		}

		//Se la lettera non è impostata correttamente (metodo risolto mettendo il required del form, ma comunque aggirabile agendo sull'URL)
		if(request.getParameter("letteraGET") == null) {
			//Nuovo indice random
			Random ran = new Random();
			indice = ran.nextInt(pool.length);
			lettera = ' ';
		} else {
			//Se ciò che è stato inserito è solo una lettera
			if(request.getParameter("letteraGET") != null && request.getParameter("letteraGET").length() == 1) {
				//metti nella lettera il primo carattere della richiesta
				lettera = request.getParameter("letteraGET").toLowerCase().charAt(0);
				
				//Svuota preventivamente variabile che contiene la stringa
				stringaGuess = "";

				//Attiva la flag che controlla che l'utente abbia inserito una sola lettera
				unalettera = true;
			} else {
				//Prendi tutta la stringa e inseriscila nella variabile apposita
				stringaGuess = request.getParameter("letteraGET");

				stringaGuess = stringaGuess.toLowerCase();

				//Lettera di default impostata ad 'a' (per evitare comportamenti imprevisti del programma)
				lettera = ' ';
				
				//Disattiva la flag
				unalettera = false;
			}
		}
	}
%>

<!DOCTYPE html>
<html>

	<head>
		<title>Impiccato</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>

	<style type="text/css">
		#container { text-align:center; }
		#bloc1 {
			display:		inline-block;
			margin-left:	10%;
			margin-right:	10%;
		}
		
		.button {
			border:			none;
			color:			white;
			text-align:		center;
			width:			200px;
			transition:		0.2s;
			padding-top:	5px;
			padding-bottom: 5px;
			padding-left:	10px;
			padding-right:	10px;
		}
		
		.invia {				background-color: #3dad46; }
		.invia:hover {			background-color: #42F551; }
		.nuovaParola {			background-color: #c24734; }
		.nuovaParola:hover {	background-color: #F55A42; }
	</style>

	<%
		out.print("<style>\n");
		out.print("html {\n");
		out.print("	font-family: \"Lucida Console\", Courier, monospace;\n");
		out.print("	background-repeat: no-repeat;\n");
		out.print("	margin: 0;\n");
		out.print("	height: 100%;\n");
		if(indice % 2 == 0) {
			out.print("	background-image: linear-gradient(#EF6F6C, #465775);\n");
			out.print("	color: white;\n");
		} else {
			out.print("	background-image: linear-gradient(#DB5461, #403F4C);\n");
			out.print("	color: white;\n");
		}
		out.print("}\n");
		out.print("</style>\n");
	%>

	<div align="center">
		<h1>L'impiccato!</h1><br>
		<h2>
		<%
			//Se tutti i parametri sono impostati a null allora è il primo avvio della pagina
			if(
				request.getParameter("letteraGET")	== null &&
				request.getParameter("tentativiGET")== null &&
				request.getParameter("indiceGET")	== null &&
				request.getParameter("nuovaParola")	== null) {
				primoAvvio = true;
			}else {
				//Se non si tratta del primo avvio della pagina, allora effettua i controlli sulla pagina
				primoAvvio = false;

				//Crea una parola di tipo StringBuilder, uguale alla parola scelta da indovinare
				StringBuilder parola = new StringBuilder(pool[indice]);

				//Scorri tutta la parola
				for(int i = 0; i < pool[indice].length(); i++)
				{
					//Imposta i caratteri della parola vuota
					//Stampa la differenza tra consonanti e vocali
					switch(pool[indice].charAt(i))
					{
						case 'a':
							parola.setCharAt(i,'*');
							break;
						case 'e':
							parola.setCharAt(i,'*');
							break;
						case 'i':
							parola.setCharAt(i,'*');
							break;
						case 'o':
							parola.setCharAt(i,'*');
							break;
						case 'u':
							parola.setCharAt(i,'*');
							break;
						default:
							parola.setCharAt(i,'_');
							break;
					}
				}

				//Se è stata inserita una sola lettera
				if(unalettera == true) {
					//guess è la lettera inserita
					char guess = lettera;

					//Controlla se il carattere (preso dalla richiestaGET) è presente nella parola e lo sostituisce se lo trova
					for(int j = 0; j < pool[indice].length(); j++) {
						if(pool[indice].charAt(j) == guess) {
							parola.setCharAt(j,guess);
							trovata = true;
						}
					}

					//Imposta il valore della flag a true, diciamo in questo modo al programma che la parola è stata indovianata
					finita = true;

					//Se la lettera è stata trovata
					if(trovata == true) {
						out.print("Lettera <span style=\"color:limegreen;\">" + guess + "</span> trovata!<br>");
					} else {
						if(request.getParameter("letteraGET") != null) {
							out.print("Lettera <span style=\"color:tomato;\">" + guess + "</span> non trovata!<br>");
						}
					}

					//Scorri i tentativi, per ogni lettera della stringa dei tentativi controlla se c'è una corrispondenza con la parola da indovinare
					for(int i = 0; i < tentativi.length(); i++) {
						for(int j = 0; j < parola.length(); j++) {
							//In caso ci sia questa corrispondenza, imposta il carattere trovato, da '|' o '_' alla lettera presa in esame
							if(pool[indice].charAt(j) == tentativi.charAt(i))
							{
								parola.setCharAt(j,tentativi.charAt(i));
							}
						}
					}

					//Il ciclo for ci dice se è veramente finita o no, infatti in caso vi siano ancora '|' o '_' la parola non è stata indovinata del tutto
					for(int j = 0;j < pool[indice].length(); j++) {
						//Se la parola contiene ancora underscore o pipe allora non è finita
						if(parola.charAt(j) == '_' || parola.charAt(j) == '|') {
							finita = false;
						}
					}

					//Se effettivamente la parola è finita e tutte le lettere sono state indovinate, stampa il messaggio di vittoria
					if(finita == true) {
						out.print("Hai vinto!<br>");
						out.print("La parola era: <span style=\"color:limegreen;\"> " + pool[indice] + "</span>");
					}
				}else{ //Ci troviamo nel caso in cui l'utente non ha inserito solo una lettera ma una stringa, come una parola
					//se la stringa presa dalla richiesta in GET non equivale a quella da indovinare<
					if(stringaGuess.equals(pool[indice]) == false) {
						out.println("Hai sbagliato parola!<br>");

						//Scorri i tentativi, per ogni lettera della stringa dei tentativi controlla se c'è una corrispondenza con la parola da indovinare
						for(int i = 0; i < tentativi.length(); i++) {
							for(int j = 0; j < parola.length(); j++) {
								//In caso ci sia questa corrispondenza, imposta il carattere trovato, da '|' o '_' alla lettera presa in esame
								if(pool[indice].charAt(j) == tentativi.charAt(i)) {
									parola.setCharAt(j,tentativi.charAt(i));
								}
							}
						}

						//La parola non è finita (il gioco continua)
						finita = false;
					}else
					{
						out.println("Hai indovinato correttamente!<br>");
						out.print("La parola era: <span style=\"color:limegreen;\"> " + pool[indice] + "</span>");

						//La parola è completa (il gioco finisce)
						finita = true;
					}
				}

				if(finita == false)
				{
					out.print(parola);
				}
			}
		%>
		</h2>
	</div>

	<div id="container">
		<div id="bloc1" style="align: center;">
			<form method="GET" action="hangman.jsp" autocomplete="off" required>
				<%
					if(finita == false)
					{
						//Stampa questo campo testuale se la partita è ancora in corso
						out.println("<input type=\"text\" name=\"letteraGET\" required=\"true\" autofocus placeholder=\"Lettera o parola\">");
					}else
					{
						out.print("<small>* = vocali _ = consonanti</small>");
						out.println("<br>");
						//Se la partita è fnita, genera un nuovo indice casuale pulendo la stringa dei tentativi
						out.println("<br><input class=\"button invia\" type=\"submit\" value=\"Inizia una nuova partita\" autofocus>");
					}
				%>
				<br>
				<%
					if(request.getParameter("indiceGET") != null) {
						out.println("<input type=\"number\" hidden name=\"indiceGET\" value=\"" + indice + "\">");
					}

					//Se l'utente non vuole scegliere una nuova parola e la partita non è ancora finita
					if(finita == false)
					{
						if(request.getParameter("tentativiGET") != null)
						{
							out.println("\t\t\t\t\t<div style=\"width:auto;\">");
							//Prendi la stringa dei tentativi e aggiungi alla fine il carattere appena provato poi stampa i tentativi
							tentativi = request.getParameter("tentativiGET");
							
							if(unalettera == true) {
								tentativi = tentativi + lettera;
							}

							if(request.getParameter("letteraGET") != null) {
								out.print("\t\t\t\t\t<span>Lettere già inserite:</span><br><span style=\"color: #f47e60; font-weight: bold;\">\t\t\t\t\t\t");
								for(int j = 0; j < tentativi.length(); j++) {
									out.print(tentativi.charAt(j));
								}
								out.print("\t\t\t\t\t\t</span>\n");
							}

							out.print("</span><br>");
							out.println("\t\t\t\t\t</div>");

							//Inserisci i tentativi nel campo hidden del form
							out.println("\t\t\t\t\t<input type=\"text\" hidden name=\"tentativiGET\" value=\"" + tentativi + "\">");
						} else {
							//Altrimenti se l'utente vuole scegliere una nuova parola svuota i tentativi (imposta un valore di default, non a null, ma stringa vuota)
							out.println("<input type=\"text\" hidden name=\"tentativiGET\" value=\"\">");
						}
					} else {
						out.println("<input type=\"text\" hidden name=\"tentativiGET\" value=\"\">");
					}

					if(finita==false) {
						out.println("\t\t\t\t\t<input class=\"button invia\" type=\"submit\" value=\"Invia\">");
					}
				%>
			</form>
			<form method="GET" action="" autocomplete="off" required>
				<%
					//Stampa il seguente form composto da un solo campo, questo form resetta i parametri e fa iniziare una nuova partita
					if(finita == false) {
						out.println("<button class=\"button nuovaParola\" type=\"submit\" value=\"nuovaParola\">Nuova Parola</button>");
					}
				%>
			</form>
		</div>
	</div>
	</body>
</html>
