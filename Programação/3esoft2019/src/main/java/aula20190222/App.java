package aula20190222;

public class App {
	public static void main(String[] args) {
		boolean ganhaBem = 5000.33 < obterSalario();
		System.out.println(ganhaBem);
	}
	
	public static Double obterSalario() 
	{
		java.util.Scanner leitor = new java.util.Scanner(System.in);
		System.out.print("Digite sua idade: ");
		int idade = leitor.nextInt();
		int valor_base = 1000;
		int valor_maximo = 10000;
		if(idade>=18){
			int diferenca = idade-17;
			double salario = diferenca*valor_base;
			if(salario>valor_maximo){
				salario = valor_maximo;
			}
			System.out.println("Seu salário é de: " + salario);
			return salario;
		}else
			return 0.00;
	}	
}
