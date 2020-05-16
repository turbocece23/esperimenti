import java.util.*;
import java.io.*;

/*
Riceve un input
Scrive quell'input nel file seguendo l'ordine
Legge il file
*/

class calendario
{

	static Scanner input = new Scanner(System.in);

	public static void main(String args[])
	{
		System.out.println("Vuoi leggere dal file [l|L] o scriverci [s|S]?");

		char scelta = input.nextLine().charAt(0);
		
		boolean scrivi=false;
		boolean leggi=false;

		switch(scelta)
		{
		case 's':
		case 'S':
			scrivi=true;
			leggi=false;
			break;
		case 'l':
		case 'L':
			leggi=true;
			scrivi=false;
			break;
		default:
			leggi=true;
			scrivi=false;
			System.out.println("Carattere inserito errato!");
			System.exit(1);
			break;
		}

		if(scrivi==true && leggi==false)
		{
			try
			{
				File file = new File("memoria.txt");
				FileWriter fw = new FileWriter(file, true);
				FileReader fr = new FileReader("id.txt");

				System.out.println("Inserisci una data (Scritta dd-mm-yyyy)");
				String dataInput = input.nextLine();

				System.out.println("Inserisci una descrizione: ");
				String descrizione = input.nextLine();

				//Lettura dell'id
				int character;
				char charID='X';
				character = fr.read();
				charID = (char) character;

				int id = Character.getNumericValue(charID);

				fw.write(id+";"+dataInput+";"+descrizione+";\n");
				fw.close();
				fw = new FileWriter("id.txt");
				fw.write((String)Integer.toString(id+1));
				fw.close();

			}catch(Exception e)
			{
				System.out.println("Errore: " + e);
			}
		}else if(scrivi==false && leggi==true)
		{
			try
			{
				File file = new File("memoria.txt");
				Scanner sc = new Scanner(file);
				while(sc.hasNextLine())
				{
					String line = sc.nextLine();
					System.out.println(line);

				}
			}catch(Exception e)
			{
				System.out.println("Errore: "+e);
			}
		}
	}
}