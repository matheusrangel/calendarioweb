package br.edu.ifpb.calendario.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifpb.calendario.dao.AnotacaoDAO;
import br.edu.ifpb.calendario.dao.UsuarioDAO;
import br.edu.ifpb.calendario.models.Anotacao;
import br.edu.ifpb.calendario.models.Usuario;

import com.google.gson.Gson;

@WebServlet("/calendario.do")
public class CalendarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public CalendarioServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");

		switch (op) {
		case "logoff":
			logoff(request, response);
			break;

		case "excluirconta":
			excluirConta(request, response);
			break;

		case "eventos":
			listarEventosUsuario(request, response);
			break;

		case "cadastrarAnotacao":
			try {
				cadastrarAnotacao(request, response);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			break;

		default:
			break;
		}
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

		case "alterarsenha":
			alteraSenha(request, response);
			break;

		default:
			break;
		}
	}

	public void listarEventosUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		List<Anotacao> anotacoes = new ArrayList<Anotacao>();
		anotacoes = usuario.getAnotacoes();
		
		StringBuilder listaAnotacoes = new StringBuilder();		
		for (Anotacao anotacao : anotacoes) {
			String data = new SimpleDateFormat("yyyy-MM-dd").format(anotacao.getData());
			
			listaAnotacoes.append("{");
			listaAnotacoes.append("title: '"+anotacao.getMensagem()+"',");
			listaAnotacoes.append("start: '"+data+"',");
			listaAnotacoes.append("},");
		}
		
		request.setAttribute("anotacoes", listaAnotacoes);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

	public void cadastrarAnotacao(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		AnotacaoDAO anotacaoDAO =  new AnotacaoDAO();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Anotacao anotacao = new Anotacao();

		String dataString = "2015-05-10";
		Date data = new SimpleDateFormat("yyyy-MM-dd").parse(dataString);

		anotacao.setData(data);
		anotacao.setMensagem("Anotação Teste");
		anotacao.setUsuario(usuario);
		anotacaoDAO.persist(anotacao);
		anotacaoDAO.close();
		
		usuario = usuarioDAO.findByLogin(usuario.getLogin());
		usuarioDAO.close();
		session.setAttribute("usuario", usuario);

		response.sendRedirect("index.jsp");
	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = new Usuario();

		usuario = usuarioDAO.findByLogin(request.getParameter("login"));
		if (usuario != null && usuario.getSenha().equals(request.getParameter("senha"))) {
			HttpSession session = request.getSession();
			session.setAttribute("usuario", usuario);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("erro", "Login e/ou Senha Errada!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
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
			String admin = request.getParameter("admin");

			if (admin != null) {
				if (admin.equals("true") && !usuarioDAO.existeAdmin()) {
					usuario.setAdmin(true);
					usuarioDAO.persist(usuario);
					usuarioDAO.close();
					response.sendRedirect("login.jsp");
				} else if (admin.equals("true") && usuarioDAO.existeAdmin()) {
					request.setAttribute("erro", "Já existe um admin!");
					RequestDispatcher rd = request.getRequestDispatcher("cadastro.jsp");
					rd.forward(request, response);
				}
			} else {
				usuarioDAO.persist(usuario);
				usuarioDAO.close();
				response.sendRedirect("login.jsp");
			}
		} else {
			request.setAttribute("erro", "Login ja existe!");
			RequestDispatcher rd = request.getRequestDispatcher("cadastro.jsp");
			rd.forward(request, response);
		}

	}

	public void alteraSenha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (usuario.getAdmin() != null) {
			String senhaAtual = request.getParameter("senha_atual");
			String senhaNova = request.getParameter("senha_nova");
			UsuarioDAO usuarioDAO = new UsuarioDAO();

			if (senhaAtual.equals(senhaNova)) {
				request.setAttribute("erro", "A senha nova não pode ser igual a atual.");
				RequestDispatcher rd = request.getRequestDispatcher("alterarsenha.jsp");
				rd.forward(request, response);
			} else {
				if (senhaAtual.equals(usuarioDAO.findByLogin(usuario.getLogin()).getSenha())) {
					usuario.setSenha(senhaNova);
					usuarioDAO.update(usuario);
					usuarioDAO.close();
					session.setAttribute("usuario", usuario);
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);

				} else {
					request.setAttribute("erro", "Senha atual não confere!");
					RequestDispatcher rd = request.getRequestDispatcher("alterarsenha.jsp");
					rd.forward(request, response);
				}
			}
		} else {
			request.setAttribute("erro", "Apenas o admin pode alterar senha!");
			RequestDispatcher rd = request.getRequestDispatcher("alterarsenha.jsp");
			rd.forward(request, response);
		}
	}

	public void excluirConta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		UsuarioDAO usuarioDAO = new UsuarioDAO();

		if (usuario.getAdmin() == null) {
			usuarioDAO.remove(usuario);
			usuarioDAO.close();
			logoff(request, response);
		} else {
			request.setAttribute("erro", "Admins não podem se excluir!");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	}

	public void logoff(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		response.sendRedirect("index.jsp");
	}
}
