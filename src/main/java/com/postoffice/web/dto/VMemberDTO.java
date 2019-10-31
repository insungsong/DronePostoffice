package com.postoffice.web.dto;

public class VMemberDTO {
	private String vmid;
	private String vmname;
	private String vmpassword;
	private String vmtel;
	private String vmphoto;
	private String vid;
	
	public String getVmid() {
		return vmid;
	}
	public void setVmid(String vmid) {
		this.vmid = vmid;
	}
	public String getVmname() {
		return vmname;
	}
	public void setVmname(String vmname) {
		this.vmname = vmname;
	}
	
	public String getVmpassword() {
		return vmpassword;
	}
	
	public void setVmpassword(String vmpassword) {
		this.vmpassword = vmpassword;
	}
	
	public String getVmtel() {
		return vmtel;
	}
	
	public void setVmtel(String vmtel) {
		this.vmtel = vmtel;
	}
	public String getVmphoto() {
		return vmphoto;
	}
	public void setVmphoto(String vmphoto) {
		this.vmphoto = vmphoto;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
}
