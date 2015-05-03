package br.edu.ifpb.calendario.servlets;

import java.io.IOException;

import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifpb.calendario.dao.UsuarioDAO;
import br.edu.ifpb.calendario.models.Usuario;

@WebServlet("/calendario.do")
public class CalendarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public CalendarioServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");

		switch (op) {
		case "login":
			login(request, response);
			break;

		case "cadastro":
			cadastraUsuario(request, response);
			break;

		default:
			break;
		}
	}
	

	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = usuarioDAO.findByLogin(request.getParameter("login").toLowerCase());
		HttpSession session = request.getSession();
		session.setAttribute("usuario", usuario);
		response.sendRedirect("index.jsp");
	}


	public void cadastraUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = new Usuario();

		usuario = usuarioDAO.findByLogin(request.getParameter("login").toLowerCase());
		
		if (usuario == null) {
			usuario = new Usuario();
			usuario.setLogin(request.getParameter("login").toLowerCase());
			usuario.setNome(request.getParameter("nome"));
			usuario.setSenha(request.getParameter("senha"));
			usuarioDAO.persist(usuario);
			usuarioDAO.close();
			response.sendRedirect("login.jsp");
		} else {
			request.setAttribute("erro", "Login ja existe!");
			RequestDispatcher rd = request.getRequestDispatcher("cadastro.jsp");
			rd.forward(request, response);
		}
		
	}
}
