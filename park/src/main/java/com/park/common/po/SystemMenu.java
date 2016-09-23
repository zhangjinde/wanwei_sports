package com.park.common.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SystemMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "system_menu", catalog = "park")
public class SystemMenu implements java.io.Serializable {

	// Fields

	private String menuId;
	private String parentMenuId;
	private String menuName;
	private String menuCode;
	private String menuUrl;

	// Constructors

	/** default constructor */
	public SystemMenu() {
	}

	/** minimal constructor */
	public SystemMenu(String menuName, String menuUrl) {
		this.menuName = menuName;
		this.menuUrl = menuUrl;
	}

	/** full constructor */
	public SystemMenu(String parentMenuId, String menuName, String menuCode,
			String menuUrl) {
		this.parentMenuId = parentMenuId;
		this.menuName = menuName;
		this.menuCode = menuCode;
		this.menuUrl = menuUrl;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "menuId", unique = true, nullable = false, length = 16)
	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	@Column(name = "parentMenuId", length = 16)
	public String getParentMenuId() {
		return this.parentMenuId;
	}

	public void setParentMenuId(String parentMenuId) {
		this.parentMenuId = parentMenuId;
	}

	@Column(name = "menuName", nullable = false, length = 32)
	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Column(name = "menuCode", length = 32)
	public String getMenuCode() {
		return this.menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	@Column(name = "menuURL", nullable = false, length = 65535)
	public String getMenuUrl() {
		return this.menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

}