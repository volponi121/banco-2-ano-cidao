package aula20190314;

public class Produto {
	private String descricao;
	private String codigo;
	
	public Produto(String codigo, String descricao){
		this.setCodigo(codigo);
		this.setDescricao(descricao);
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
}
