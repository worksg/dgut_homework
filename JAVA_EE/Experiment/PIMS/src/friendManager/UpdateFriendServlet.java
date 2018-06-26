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

public class UpdateFriendServlet extends HttpServlet {
	public void wrong1() {
		String msg = "请输入要修改人的姓名！";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	public void wrong2() {
		String msg = "此姓名不存在,无法修改！";
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
		String friendName = request.getParameter("friendName");
		if (friendName.length() == 0) {
			wrong1();
			response.sendRedirect("http://localhost:8080/PIMS/friendManager/updateFriend.jsp");
		} else {
			try {
				Connection con = null;
				Statement stmt = null;
				ResultSet rs = null;
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://192.168.14.5:3306/person?characterEncoding=utf8&useSSL=false";
				con = DriverManager.getConnection(url, "root", "kali");
				stmt = con.createStatement();
				String sql1 = "select * from friends where name='" + friendName + "'";
				rs = stmt.executeQuery(sql1);
				rs.last();
				int k = rs.getRow();
				rs.beforeFirst();
				if (k < 1) {
					wrong2();
					response.sendRedirect("http://localhost:8080/PIMS/friendManager/updateFriend.jsp");
				} else {
					HttpSession session = request.getSession();
					ArrayList friendslist2 = null;
					friendslist2 = new ArrayList();
					while (rs.next()) {
						LookFriendBean ff = new LookFriendBean();
						ff.setName(rs.getString("name"));
						ff.setPhone(rs.getString("phone"));
						ff.setEmail(rs.getString("email"));
						ff.setWorkPlace(rs.getString("workPlace"));
						ff.setPlace(rs.getString("place"));
						ff.setQQ(rs.getString("QQ"));
						friendslist2.add(ff);
						session.setAttribute("friendslist2", friendslist2);
					}
					ArrayList friendslist3 = null;
					UpdateFriendBean nn = new UpdateFriendBean();
					friendslist3 = new ArrayList();
					nn.setName(friendName);
					friendslist3.add(nn);
					session.setAttribute("friendslist3", friendslist3);
				}
				rs.close();
				stmt.close();
				con.close();
				response.sendRedirect("http://localhost:8080/PIMS/friendManager/updateFriendMessage.jsp");
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