#include <stdio.h>

int X,O; //giocatori, croci e cerchi
int vittoria; //se vittoria è 0 allora il gioco continua, sennò se è 1 allora uno dei due giocatori ha vinto
int turnoFinito=0;
char uno = '_';
char due = '_';
char tre = '_';
char qua = '_';
char cin = '_';
char sei = '_';
char set = '_';
char ott = '_';
char nov = '_';

int controllaVittoria(char uno,char due,char tre,char qua,char cin,char sei,char set,char ott,char nov)
{
	//Casi di vittoria
	if((uno=='X' && due=='X' && tre=='X') || (uno=='O' && due=='O' && tre=='O')){
	if(uno==due && due==tre){
		printf("Hanno vinto: %c",uno);
		return 1;}}

	if((qua=='X' && cin=='X' && sei=='X') || (qua=='O' && cin=='O' && sei=='O')){
	if(qua==cin && cin==sei){
		printf("Hanno vinto: %c",qua);
		return 1;}}

	if((set=='X' && ott=='X' && nov=='X') || (set=='O' && ott=='O' && nov=='O')){
	if(set==ott && ott==nov){
		printf("Hanno vinto: %c",set);
		return 1;}}
	
	if((uno=='X' && qua=='X' && set=='X') || (uno=='O' && qua=='O' && set=='O')){
	if(uno==qua && qua==set){
		printf("Hanno vinto: %c",uno);
		return 1;}}
	
	if((due=='X' && cin=='X' && ott=='X') || (due=='O' && cin=='O' && ott=='O')){
	if(due==cin && cin==ott){
		printf("Hanno vinto: %c",due);
		return 1;}}
	
	if((tre=='X' && sei=='X' && nov=='X') || (tre=='O' && sei=='O' && nov=='O')){	
	if(tre==sei && sei==nov){
		printf("Hanno vinto: %c",tre);
		return 1;}}
	
	if((uno=='X' && cin=='X' && nov=='X') || (uno=='O' && cin=='O' && nov=='O')){
	if(uno==cin && cin==nov){
		printf("Hanno vinto: %c",uno);
		return 1;}}
	
	if((tre=='X' && cin=='X' && set=='X') || (tre=='O' && cin=='O' && set=='O')){
	if(tre==cin && cin==set){
		printf("Hanno vinto: %c",tre);
		return 1;}}
	return 0;
}

int controllaInserimento(char posto, char giocatore)
{
	//La cella selezionata è già di un altro giocatore
	//Se <la cella non è vuota> E <la cella è diversa dal giocatore corrente>
	if(posto!='_' || posto==giocatore)
	{
		printf("Questa cella non può essere occupata!\n");
		return 1;
	//La cella selezionata è già del giocatore
	}
	return 0;
}

void controllaPareggio()
{
	if(uno!='_' && due!='_' && tre!='_' && qua!='_' && cin!='_' && sei!='_' && set!='_' && ott!='_' && nov!='_')
	{
		printf("\nLa partità è finita in parità, resetto il tabellone\n");
		uno='_';
		due='_';
		tre='_';
		qua='_';
		cin='_';
		sei='_';
		set='_';
		ott='_';
		nov='_';
	}
}


int main()
{
	printf("Tabella di gioco:\n\n");
	printf("_%c_|_%c_|_%c_\n",uno,due,tre);
	printf("_%c_|_%c_|_%c_\n",qua,cin,sei);
	printf("_%c_|_%c_|_%c_\n",set,ott,nov);
	printf("Il giocatore 1: X\n");
	printf("Il giocatore 2: O\n\n");
	
	vittoria=0; //inizializzazione di vittoria e inizio partita
	while(vittoria==0){
		//Turno del giocatore 1
		do
		{
			printf("Giocatore 1, fai la tua scelta: ");
			scanf("%d",&X);
			
			switch(X)
			{
				case 1:
					if(controllaInserimento(uno,'X')==0){uno='X'; turnoFinito=1;}
					break;
				case 2:
					if(controllaInserimento(due,'X')==0){due='X'; turnoFinito=1;}
					break;
				case 3:
					if(controllaInserimento(tre,'X')==0){tre='X'; turnoFinito=1;}
					break;
				case 4:
					if(controllaInserimento(qua,'X')==0){qua='X'; turnoFinito=1;}
					break;
				case 5:
					if(controllaInserimento(cin,'X')==0){cin='X'; turnoFinito=1;}
					break;
				case 6:
					if(controllaInserimento(sei,'X')==0){sei='X'; turnoFinito=1;}
					break;
				case 7:
					if(controllaInserimento(set,'X')==0){set='X'; turnoFinito=1;}
					break;
				case 8:
					if(controllaInserimento(ott,'X')==0){ott='X'; turnoFinito=1;}
					break;
				case 9:
					if(controllaInserimento(nov,'X')==0){nov='X'; turnoFinito=1;}
					break;
				
			}
		}while(turnoFinito!=1);
		
		turnoFinito=0;
		controllaPareggio();
		
		printf("_%c_|_%c_|_%c_\n",uno,due,tre);
		printf("_%c_|_%c_|_%c_\n",qua,cin,sei);
		printf("_%c_|_%c_|_%c_\n\n\n\n",set,ott,nov);
		
		if(controllaVittoria(uno,due,tre,qua,cin,sei,set,ott,nov)==1)
		{
			break;
		}
		
		//Turno del Giocatore 2
		do
		{
			printf("Giocatore 2, fai la tua scelta: ");
			scanf("%d",&O);
			
			switch(O)
			{
				case 1:
					if(controllaInserimento(uno,'O')==0){uno='O'; turnoFinito=1;}
					break;
				case 2:
					if(controllaInserimento(due,'O')==0){due='O'; turnoFinito=1;}
					break;
				case 3:
					if(controllaInserimento(tre,'O')==0){tre='O'; turnoFinito=1;}
					break;
				case 4:
					if(controllaInserimento(qua,'O')==0){qua='O'; turnoFinito=1;}
					break;
				case 5:
					if(controllaInserimento(cin,'O')==0){cin='O'; turnoFinito=1;}
					break;
				case 6:
					if(controllaInserimento(sei,'O')==0){sei='O'; turnoFinito=1;}
					break;
				case 7:
					if(controllaInserimento(set,'O')==0){set='O'; turnoFinito=1;}
					break;
				case 8:
					if(controllaInserimento(ott,'O')==0){ott='O'; turnoFinito=1;}
					break;
				case 9:
					if(controllaInserimento(nov,'O')==0){nov='O'; turnoFinito=1;}
					break;
				
			}
		}while(turnoFinito!=1);
		
		turnoFinito=0;
		controllaPareggio();
		
		printf("_%c_|_%c_|_%c_\n",uno,due,tre);
		printf("_%c_|_%c_|_%c_\n",qua,cin,sei);
		printf("_%c_|_%c_|_%c_\n\n\n\n",set,ott,nov);
		
		if(controllaVittoria(uno,due,tre,qua,cin,sei,set,ott,nov)==1)
		{
			break;
		}
		
	}
	return 0;
}


