package com.klef.jfsd.project.StudentCarrerProject.model;


public class Response {
	public Response(Integer id, String response) {
		super();
		this.id = id;
		this.response = response;
	}
	private Integer id;
	private String response;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
}
