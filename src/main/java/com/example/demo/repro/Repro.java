package com.example.demo.repro;

public class Repro {
	private int num;
	private int repro_num;
	private String repro_content;
	private String repro_writer_id;

	public Repro() {

	}

	public Repro(int num, int repro_num, String repro_content, String repro_writer_id) {

		this.num = num;
		this.repro_num = repro_num;
		this.repro_content = repro_content;
		this.repro_writer_id = repro_writer_id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRepro_num() {
		return repro_num;
	}

	public void setRepro_num(int repro_num) {
		this.repro_num = repro_num;
	}

	public String getRepro_content() {
		return repro_content;
	}

	public void setRepro_content(String repro_content) {
		this.repro_content = repro_content;
	}

	public String getRepro_writer_id() {
		return repro_writer_id;
	}

	public void setRepro_writer_id(String repro_writer_id) {
		this.repro_writer_id = repro_writer_id;
	}

	@Override
	public String toString() {
		return "Repro [num=" + num + ", repro_num=" + repro_num + ", repro_content=" + repro_content
				+ ", repro_writer_id=" + repro_writer_id + "]";
	}

}
