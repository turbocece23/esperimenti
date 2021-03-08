import java.util.*;
import java.io.*;
import java.lang.Object;


class hangman
{

	//Pool di parole da scegliere
	static String[] pool = new String[] {"sormontare", "gnocca", "piedini", "parapsicologia", "interludio", "fusibile", "turbocompressore", "sassofono", "aiuola", "pipoto", "saverio"};
	static Scanner input = new Scanner(System.in);
	static int defaultTentativi = 10;


	//Colori
	public static final String ANSI_RESET = "\u001B[0m";
	public static final String ANSI_RED = "\u001B[1;31m";
	public static final String ANSI_GREEN = "\u001B[1;32m";
	public static final String ANSI_YELLOW = "\u001B[1;33m";

	public static void main(String args[])
	{
		//Tentativi che può fare il giocatore
		int tentativi=defaultTentativi;

		//Seleziona una parola
		System.out.println("Una parola verrà selzionata a caso");
		Random ran = new Random();
		int randomIndex = ran.nextInt(pool.length);

		//SOLO PER IL DEBUG Viene stampata la parola selezionata
		//System.out.println("Parola selezionata: "+ pool[randomIndex]);

		//Viene creata la stringa di tipo StringBuilder e sarà la prola da indovinare
		StringBuilder parola = new StringBuilder(pool[randomIndex]);

		//Stampa la parola vuota
		for(int i=0;i<pool[randomIndex].length();i++)
		{
			//Imposta i caratteri della parola vuota
			//Stampa la differenza tra consonanti e vocali
			switch(pool[randomIndex].charAt(i))
			{
				case 'a':
					parola.setCharAt(i,'|');
					break;
				case 'e':
					parola.setCharAt(i,'|');
					break;
				case 'i':
					parola.setCharAt(i,'|');
					break;
				case 'o':
					parola.setCharAt(i,'|');
					break;
				case 'u':
					parola.setCharAt(i,'|');
					break;
				default:
					parola.setCharAt(i,'_');
					break;
			}
		}

		String stringGuess;		//Stringa inserita dall'utente
		char guess;				//In caso l'utente abbia inserito solo una lettera
		int j;					//Contatore del ciclo for
		boolean trovata=false;	//Flag che controlla se la lettera è stata trovata o no
		boolean finita=true;	//Flag che controlla che la stringa sia composta di sole lettere e non underscore

		do
		{
			//Stampa un riepilogo della situazione
			System.out.println("Tentativi: "+tentativi+"\n");
			System.out.print(parola+" :");

			//L'utente inserisce una lettera o una stringa
			stringGuess = input.nextLine();

			//Controlla se l'utente ha inserito una lettera o una stringa
			if(stringGuess.length()==1)
			{
				//guess è il carattere che ha inserito l'utente
				guess=stringGuess.charAt(0);

				//Controlla se il carattere è presente nella parola
				for(j=0;j<pool[randomIndex].length();j++)
				{
					if(pool[randomIndex].charAt(j)==guess)
					{
						parola.setCharAt(j,guess);
						//Attiva la flag
						trovata=true;
					}
				}

				//Se la lettera è stata tovata
				if(trovata == true)
				{
					System.out.println(ANSI_YELLOW+"=== Lettera "+guess+" trovata!"+ANSI_RESET);
				}else
				{
					System.out.println(ANSI_RED+"Lettera "+guess+" NON trovata!"+ANSI_RESET);
					tentativi--; //Togli un tentativo da quelli dell'utente
				}
				//Resetta la flag
				trovata = false;

				//Questa flag controlla se la parola è stata finita
				finita = true;
				for(j=0;j<pool[randomIndex].length();j++)
				{
					//Se la parola contiene ancora underscore allora non è finita
					if(parola.charAt(j) == '_')
					{
						finita=false;
					}
				}

				//Se la parola è finita, fai finire il programma
				if(finita == true)
				{
					System.out.println(ANSI_GREEN+"=== La parola era: " + ANSI_YELLOW + pool[randomIndex] + ANSI_GREEN + "!" + ANSI_RESET);
					System.out.println(ANSI_GREEN+"=== Hai tovato tutte le lettere!"+ANSI_RESET);
					break;
				}
			//L'utente non ha inserito un carattere ma una stringa
			}else if(stringGuess.equals(pool[randomIndex])==false)
			{
				//Se la stringa inserita è diversa dalla parola di partenza
				tentativi--;
			}else if(stringGuess.equals(pool[randomIndex]))
			{
				//La stringa inserita è uguale alla prola inserita, fai finire il programma
				break;
			}
		//Contina ad eseguire questo codice fintanto che il giocatore ha vite
		}while(tentativi>0);

		if(tentativi==0)
		{
			System.out.println(ANSI_RED+"=== La parola era: "+pool[randomIndex]+ANSI_RESET);
			System.out.println(ANSI_RED+"=== Hai perso!"+ANSI_RESET);
		}else
		{
			System.out.println(ANSI_GREEN+"=== Hai indovinato!"+ANSI_RESET);
		}
		System.out.println("\n");
	}
}