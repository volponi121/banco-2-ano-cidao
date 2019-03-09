package aula20190308.testesMetodosBasicos;

public class Util {
	
	public static int somar(int v1, int v2) {
		return v1+v2;
	}
	
	public static double triplo(double valor){
		return valor*3;
	}
	
	public static int contarPares(int[] arrayAuxiliar){
		int nmrpares = 0;
		
		for(int contador = 0; contador < arrayAuxiliar.length; contador++) {
			if(arrayAuxiliar[contador] % 2 == 0) {
				nmrpares++;
			}
		}
		return nmrpares;
	}
	
	
}
