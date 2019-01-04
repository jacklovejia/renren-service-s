package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author baihe
 * @email sunlightcs@gmail.com
 * @date 2019-01-03 16:22:51
 */
@TableName("sys_msg")
public class SysMsgEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Integer id;
	/**
	 * 类型
	 */
	private Integer type;
	/**
	 * 手机号
	 */
	private String phoneNo;
	/**
	 * 内容
	 */
	private String context;
	/**
	 * 状态
	 */
	private Integer status;
	/**
	 * 时间
	 */
	private Date addTime;

	/**
	 * 设置：id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：类型
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * 获取：类型
	 */
	public Integer getType() {
		return type;
	}
	/**
	 * 设置：手机号
	 */
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	/**
	 * 获取：手机号
	 */
	public String getPhoneNo() {
		return phoneNo;
	}
	/**
	 * 设置：内容
	 */
	public void setContext(String context) {
		this.context = context;
	}
	/**
	 * 获取：内容
	 */
	public String getContext() {
		return context;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * 设置：时间
	 */
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	/**
	 * 获取：时间
	 */
	public Date getAddTime() {
		return addTime;
	}
}
