/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package friendManager;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import loginRegister.LoginBean;

public class DeleteFriendServlet extends HttpServlet {
	public void wrong1() {
		String msg = "请输入要删除的人的姓名！";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	public void wrong2() {
		String msg = "此联系人不存在！";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	public void right() {
		String msg = "此联系人已成功删除！";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		if (name.length() == 0) {
			wrong1();
			response.sendRedirect("http://localhost:8080/PIMS/friendManager/deleteFriend.jsp");
		} else {
			try {
				Connection con = null;
				Statement stmt = null;
				ResultSet rs = null;
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://192.168.14.5:3306/person?characterEncoding=utf8&useSSL=false";
				con = DriverManager.getConnection(url, "root", "kali");
				stmt = con.createStatement();
				String userName = "";
				HttpSession session = request.getSession();
				ArrayList login = (ArrayList) session.getAttribute("login");
				if (login == null || login.size() == 0) {
					response.sendRedirect("http://localhost:8080/PIMS/login.jsp");
				} else {
					for (int i = login.size() - 1; i >= 0; i--) {
						LoginBean nn = (LoginBean) login.get(i);
						userName = nn.getUserName();
					}
				}
				String sql1 = "select * from friends where name='" + name + "'and userName='" + userName + "'";
				rs = stmt.executeQuery(sql1);
				rs.last();
				int k = rs.getRow();
				if (k < 1) {
					wrong2();
					response.sendRedirect("http://localhost:8080/PIMS/friendManager/deleteFriend.jsp");
				} else {
					String sql2 = "delete from friends where name='" + name + "'and userName='" + userName + "'";
					stmt.executeUpdate(sql2);
					String sql3 = "select * from friends where userName='" + userName + "'";
					rs = stmt.executeQuery(sql3);
					rs.last();
					int list = rs.getRow();
					rs.beforeFirst();
					if (list < 1) {
						ArrayList friendslist = null;
						session.setAttribute("friendslist", friendslist);
					} else {
						ArrayList friendslist = null;
						friendslist = new ArrayList();
						while (rs.next()) {
							LookFriendBean ff = new LookFriendBean();
							ff.setName(rs.getString("name"));
							ff.setPhone(rs.getString("phone"));
							ff.setEmail(rs.getString("email"));
							ff.setWorkPlace(rs.getString("workPlace"));
							ff.setPlace(rs.getString("place"));
							ff.setQQ(rs.getString("QQ"));
							friendslist.add(ff);
							session.setAttribute("friendslist", friendslist);
						}
					}
				}
				rs.close();
				stmt.close();
				con.close();
				response.sendRedirect("http://localhost:8080/PIMS/friendManager/lookFriend.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}