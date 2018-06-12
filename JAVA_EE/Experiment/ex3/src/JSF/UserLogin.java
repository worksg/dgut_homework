package JSF;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@ManagedBean
@SessionScoped
public class UserLogin implements Serializable {

	private static final long serialVersionUID = 1;

	private String message = "Enter username and password.";
	private String username;
	private String password;

	public void login() throws IOException {

		HttpSession session = SessionUtils.getSession();

		tools tools = new tools();
		String fileName = "register_info.txt";
		String filePath = session.getServletContext().getRealPath("/");
		String RealfilePath = filePath + fileName;

		System.out.println(RealfilePath);
		if (tools.isExist(RealfilePath) == false) {
			File file = new File(RealfilePath);
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		FileInputStream file = new FileInputStream(RealfilePath);
		InputStreamReader reader = new InputStreamReader(file, "UTF-8");
		BufferedReader bufferReader = new BufferedReader(reader);
		String line = null;
		List<String> lines = new ArrayList<String>();
		while ((line = bufferReader.readLine()) != null) {
			lines.add(line);
		}
		bufferReader.close();

		boolean login_success = false;
		for (String oneItem : lines) {
			String[] parts = oneItem.split("\t");
			if (parts[0].equals(username) && parts[1].equals(password)) {
				// session.getServletContext().setAttribute("upload_allow", true);
				login_success = true;
				break;
			}
		}

		if (!login_success) {
			session.setAttribute("status", "anonymous"); // 设置登录状态为匿名
			setMessage("Wrong credentials.");
			setUsername("");
			setPassword("");
			ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
			externalContext.redirect("login.xhtml");
			// System.out.println(session.getAttribute("status").toString());
			// return "login";

		} else {
			session.setAttribute("status", "login"); // 设置登录状态为已登录
			session.setAttribute("username", username);

			setMessage("Successfully logged-in.");
			ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
			externalContext.redirect("index.xhtml");

			// System.out.println(session.getAttribute("status").toString());

			// return "index";
		}

	}

	public void register() throws IOException {
		HttpSession session = SessionUtils.getSession();
		if (!(username.equals("") || password.equals(""))) {
			tools tools = new tools();
			String fileName = "register_info.txt";
			String filePath = session.getServletContext().getRealPath("/");
			String RealfilePath = filePath + fileName;

			System.out.println(RealfilePath);
			if (tools.isExist(RealfilePath) == false) {
				File file = new File(RealfilePath);
				file.createNewFile();
			}
			FileInputStream file = new FileInputStream(RealfilePath);
			InputStreamReader reader = new InputStreamReader(file, "UTF-8");
			BufferedReader bufferReader = new BufferedReader(reader);
			String line = null;
			List<String> lines = new ArrayList<String>();
			while ((line = bufferReader.readLine()) != null) {
				lines.add(line);
			}
			bufferReader.close();

			boolean repeat = false;
			for (String oneItem : lines) {
				String[] parts = oneItem.split("\t");
				if (parts[0].equals(username)) {
					repeat = true;
					break;
				}
			}
			System.out.println(repeat);

			if (!repeat) {
				String record_info = String.format("%s\t%s\n", username, password);
				
				// System.out.println(record_info);
				tools.write(RealfilePath, record_info);

				setUsername("");
				setPassword("");

				// ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
				// externalContext.redirect("login.xhtml");
				HttpServletResponse response = SessionUtils.getResponse();
				response.setContentType("text/html;charset=UTF-8");

				HttpServletRequest request = SessionUtils.getRequest();
				request.setCharacterEncoding("UTF-8");

				PrintWriter out = response.getWriter();

				out.print("注册成功,三秒后跳转至登录页面");
				String content = "3;URL=login.xhtml";
				response.setHeader("REFRESH", content);

				out.close(); // 停止后续内容输出

				// return "login";

			} else {

				// ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
				// externalContext.redirect("register.xhtml");

				setUsername("");
				setPassword("");

				HttpServletResponse response = SessionUtils.getResponse();
				response.setContentType("text/html;charset=UTF-8");

				HttpServletRequest request = SessionUtils.getRequest();
				request.setCharacterEncoding("UTF-8");

				PrintWriter out = response.getWriter();

				out.append("用户名已存在！请重新填写用户名！两秒后自动刷新此页面！");
				String content = "2;URL=register.xhtml";
				response.setHeader("REFRESH", content);

				out.close(); // 停止后续内容输出

				// return "register";
			}

		}
		// return null;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}