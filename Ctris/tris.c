#include <stdio.h>
//Giocatori, croci e cerchi
int X,O;
//Se vittoria è 0 allora il gioco continua, altrimenti se è 1 allora uno dei due giocatori ha vinto
int vittoria;
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
		printf("Hanno vinto: %c!\n",uno);
		return 1;}}

	if((qua=='X' && cin=='X' && sei=='X') || (qua=='O' && cin=='O' && sei=='O')){
	if(qua==cin && cin==sei){
		printf("Hanno vinto: %c!\n",qua);
		return 1;}}

	if((set=='X' && ott=='X' && nov=='X') || (set=='O' && ott=='O' && nov=='O')){
	if(set==ott && ott==nov){
		printf("Hanno vinto: %c!\n",set);
		return 1;}}
	
	if((uno=='X' && qua=='X' && set=='X') || (uno=='O' && qua=='O' && set=='O')){
	if(uno==qua && qua==set){
		printf("Hanno vinto: %c!\n",uno);
		return 1;}}
	
	if((due=='X' && cin=='X' && ott=='X') || (due=='O' && cin=='O' && ott=='O')){
	if(due==cin && cin==ott){
		printf("Hanno vinto: %c!\n",due);
		return 1;}}
	
	if((tre=='X' && sei=='X' && nov=='X') || (tre=='O' && sei=='O' && nov=='O')){	
	if(tre==sei && sei==nov){
		printf("Hanno vinto: %c!\n",tre);
		return 1;}}
	
	if((uno=='X' && cin=='X' && nov=='X') || (uno=='O' && cin=='O' && nov=='O')){
	if(uno==cin && cin==nov){
		printf("Hanno vinto: %c!\n",uno);
		return 1;}}
	
	if((tre=='X' && cin=='X' && set=='X') || (tre=='O' && cin=='O' && set=='O')){
	if(tre==cin && cin==set){
		printf("Hanno vinto: %c!\n",tre);
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

void segnaPosto(int posto, char giocatore)
{
	switch(posto)
	{
		case 1:
			if(controllaInserimento(uno,giocatore)==0){uno=giocatore; turnoFinito=1;}
			break;
		case 2:
			if(controllaInserimento(due,giocatore)==0){due=giocatore; turnoFinito=1;}
			break;
		case 3:
			if(controllaInserimento(tre,giocatore)==0){tre=giocatore; turnoFinito=1;}
			break;
		case 4:
			if(controllaInserimento(qua,giocatore)==0){qua=giocatore; turnoFinito=1;}
			break;
		case 5:
			if(controllaInserimento(cin,giocatore)==0){cin=giocatore; turnoFinito=1;}
			break;
		case 6:
			if(controllaInserimento(sei,giocatore)==0){sei=giocatore; turnoFinito=1;}
			break;
		case 7:
			if(controllaInserimento(set,giocatore)==0){set=giocatore; turnoFinito=1;}
			break;
		case 8:
			if(controllaInserimento(ott,giocatore)==0){ott=giocatore; turnoFinito=1;}
			break;
		case 9:
			if(controllaInserimento(nov,giocatore)==0){nov=giocatore; turnoFinito=1;}
			break;
		default:
			printf("Opzione invalida, scegli un numero da 1 a 9");
			break;
	}

	return void;
}


int main()
{
	//Stampa iniziale del tabellone di gioco, questa parte non si ripeterà
	printf("Tabella di gioco:\n\n");
	printf("_%c_|_%c_|_%c_\n",uno,due,tre);
	printf("_%c_|_%c_|_%c_\n",qua,cin,sei);
	printf("_%c_|_%c_|_%c_\n",set,ott,nov);
	printf("Il giocatore 1: X\n");
	printf("Il giocatore 2: O\n\n");
	
	//Inizializzazione della variabile "booleana" vittoria e inizio partita
	vittoria=0;
	//Il ciclo si ripeterà fintanto che la vittoria non viene raggiunta e la variabile rimane a 0
	while(vittoria==0){

		//Turno del giocatore 1
		do
		{
			printf("Giocatore 1, fai la tua scelta: ");
			scanf("%d",&X);
			
			//Riempi la casella corrispondente a quella scelta dall'utente e fai finire il turno
			//impostando turnoFinito a 1
			segnaPosto(X,'X');

		}while(turnoFinito!=1);
		
		//Reimposta la variabile del turno
		turnoFinito=0;
		//Controlla la situazione attuale del tabellone
		controllaPareggio();
		
		//Stampa del tabellone attuale
		printf("_%c_|_%c_|_%c_\n",uno,due,tre);
		printf("_%c_|_%c_|_%c_\n",qua,cin,sei);
		printf("_%c_|_%c_|_%c_\n\n\n\n",set,ott,nov);
		
		//Se la partita è stata vinta da uno dei giocatori, interrompi il ciclo
		if(controllaVittoria(uno,due,tre,qua,cin,sei,set,ott,nov)==1)
		{
			break;
		}
		
		//Turno del Giocatore 2
		do
		{
			printf("Giocatore 2, fai la tua scelta: ");
			scanf("%d",&O);
			
			segnaPosto(O,'O');
			}
		}while(turnoFinito!=1);
		
		turnoFinito=0;
		controllaPareggio();
		
		printf("_%c_|_%c_|_%c_\n",uno,due,tre);
		printf("_%c_|_%c_|_%c_\n",qua,cin,sei);
		printf("_%c_|_%c_|_%c_\n\n\n\n",set,ott,nov);
		
		if(controllaVittoria(uno,due,tre,qua,cin,sei,set,ott,nov)==1)
		{
			vittoria=1;
		}
		
	}
	return 0;
}
