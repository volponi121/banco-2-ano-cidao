package aula20190314;

public class ItemPedido {
	private double quantidade;
	private double preco;
	private double descontoPercentual;
	
	public ItemPedido(Produto produto,double quantidade,double preco,double descontoPercentual){
		this.setQuantidade(quantidade);
		this.setPreco(preco);
		this.setDescontoPercentual(descontoPercentual);
	}

	public double getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(double quantidade) {
		this.quantidade = quantidade;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public double getDescontoPercentual() {
		return descontoPercentual;
	}

	public void setDescontoPercentual(double descontoPercentual) {
		this.descontoPercentual = descontoPercentual;
	}
	
	
}
