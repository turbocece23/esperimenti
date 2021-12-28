import java.util.*;

public class kaprekar {

	public static Scanner input = new Scanner(System.in);

	public static void main (String[] args) {
		boolean canContinue = false;
		Integer op = null;
		do {
			System.out.println("Immetti un numero di 4 cifre:");
			op = input.nextInt();
			if (op > 0 && op < 9999) {
				canContinue = true;
			}
		} while(!canContinue);
		
		int cont = 1;
		Integer kaprekar = null;
		do {
			List<Integer> op1 = new ArrayList<>();
			List<Integer> op2 = new ArrayList<>();
			
			for (int i = op; i > 0; i /= 10) {
				op1.add(i % 10);
				op2.add(i % 10);
			}
			
			Collections.sort(op1);
			Collections.sort(op2);
			Collections.reverse(op2);

			int op1i = 0, op2i = 0;

			int j = 1;
			// ricomponimento
			for (int i = 0; i < op1.size(); i++) {
				op1i += op1.get(i) * j;
				op2i += op2.get(i) * j;
				j = j * 10;
			}

			//System.out.println(op1i);
			//System.out.println(op2i);
			kaprekar = op1i - op2i;
			System.out.println("i: " + cont + " " + op1i + " - " + op2i + " = " + kaprekar);
			op = kaprekar;
			cont++;
		} while (kaprekar != 6174);
	}
}