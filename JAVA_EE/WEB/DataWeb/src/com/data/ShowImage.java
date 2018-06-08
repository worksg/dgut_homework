package com.data;

import java.io.IOException;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.sql.*;
import java.io.*;
import javax.naming.*;
/**
 * Servlet implementation class ShowImage
 * 
 */
/*
CREATE TABLE `customer` (
	`customerid` INT(11) NOT NULL,
	`firstname` VARCHAR(50) NULL DEFAULT NULL,
	`lastname` VARCHAR(50) NULL DEFAULT NULL,
	`address` VARCHAR(255) NULL DEFAULT NULL,
	`phone` VARCHAR(30) NULL DEFAULT NULL,
	PRIMARY KEY (`customerid`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `album` (
	`id` INT(11) UNSIGNED NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`data` BLOB NOT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
*/
@WebServlet("/ShowImage")
public class ShowImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	@Resource(name = "sample")
	private DataSource sample;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowImage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		java.sql.Connection conn;
		java.lang.String strConn;
		java.sql.Statement Stmt; // 语句对象
		java.sql.ResultSet sqlRst; // 结果集对象
		ServletOutputStream op = response.getOutputStream();
		String photoid = "";
		photoid = request.getParameter("photoid");
		String SQLString = "select * from album where id = " + photoid;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			sample = (DataSource) envContext.lookup("jdbc/sample");
			conn = sample.getConnection();
			Stmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
					java.sql.ResultSet.CONCUR_READ_ONLY);
			sqlRst = Stmt.executeQuery(SQLString);
			while (sqlRst.next()) {
				java.sql.Blob blob = sqlRst.getBlob("data");
				byte[] ab = blob.getBytes(1, (int) blob.length());
				response.setContentType("image/png");
				response.reset();
				op.write(ab);
				op.flush();
				op.close();
			}
			Stmt.close();
			conn.close();
		} catch (java.sql.SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();

		}
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
