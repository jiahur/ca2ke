package member.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;



@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/main/testPage")
	public ModelAndView testPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("testPage.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/joinForm")
	public ModelAndView memberJoinForm(HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../member/joinForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping("/main/joinCheckId")
	@ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String m_id) {
	     
        Map<Object, Object> map = new HashMap<Object, Object>();
        
        boolean exist = memberService.isExisId(m_id);
        map.put("exist", exist);
        
        return map;
    }
	@RequestMapping(value="/main/join")
	public ModelAndView joinOk(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone");
		String m_email = request.getParameter("m_email");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setM_id(m_id);
		memberDTO.setM_pwd(m_pwd);
		memberDTO.setM_name(m_name);
		memberDTO.setM_phone(m_phone);
		memberDTO.setM_email(m_email);
		
		int result = 0;
		result = memberService.join(memberDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("result", result);
		modelAndView.addObject("display", "../member/join.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/loginForm")
	public ModelAndView loginForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../member/loginForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/login")
	public ModelAndView login(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		System.out.println(m_id);
		System.out.println(m_pwd);
		String m_name = "";
		m_name = memberService.login(m_id, m_pwd);
		System.out.println(m_name);
		ModelAndView modelAndView = new ModelAndView();
		if(m_name == null) {
			modelAndView.addObject("display", "../member/login.jsp");
			modelAndView.setViewName("../main/main.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("m_id", m_id);
			session.setAttribute("m_name", m_name);
			
			modelAndView.addObject("display", "../member/login.jsp");
			modelAndView.setViewName("../main/main.jsp");
		}
		
		return modelAndView;
	}
	
	
	
	// 회원정보만 보여주는 폼 여기서 회원탈퇴및 회원정보수정 버튼을 클릭해서 움직일수있음.
	@RequestMapping(value="/main/modifyViewForm")
	public ModelAndView modifyViewForm(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.modifyView(memId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("display", "../member/modifyViewForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="/main/modifyEditCheckForm")
	public ModelAndView modifyEditCheckForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../member/modifyEditCheckForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
		
	}
	// 회원정보수정 들어가기전에 비밀번호 폼만 만들어서 DTO에 있는 비밀번호와  텍스트비밀번호가 일치하는지 확인
	@RequestMapping(value="/main/modifyEditCheck")
	public ModelAndView modifyEditCheck(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String m_pwd = request.getParameter("m_pwd");
		System.out.println(m_pwd);
		HttpSession session = request.getSession();
		String memPwd = (String) session.getAttribute("memPwd");
		System.out.println(memPwd);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("m_pwd", m_pwd);
			modelAndView.addObject("memPwd", memPwd);
			
			System.out.println(request.getRequestURI());
			modelAndView.addObject("display", "../member/modifyEditCheck.jsp");
			modelAndView.setViewName("../main/main.jsp");

		return modelAndView;
	}
	
	@RequestMapping(value="/main/modifyForm")
	public ModelAndView modifyForm(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.modifyView(memId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("display", "../member/modifyForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;

	}
	@RequestMapping(value="/main/modify")
	public ModelAndView modify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone");
		String m_email = request.getParameter("m_email");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setM_id(m_id);
		memberDTO.setM_pwd(m_pwd);
		memberDTO.setM_name(m_name);
		memberDTO.setM_phone(m_phone);
		memberDTO.setM_email(m_email);
		
		int result = 0;
		result = memberService.modifyUpdate(memberDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("display", "../member/modify.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="/main/modifyEditOklogout")
	public ModelAndView modifyEditOklogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.removeAttribute("memPwd");
		
		session.invalidate();	// 무효화 : 모두 지우기
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../member/loginForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/logOut")
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.removeAttribute("memPwd");
		
		session.invalidate();	// 무효화 : 모두 지우기
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../member/logOut.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="/main/deleteForm")
	public ModelAndView deleteForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../member/deleteForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="/main/delete")
	public ModelAndView delete(HttpServletRequest request) {
		String m_pwd = request.getParameter("m_pwd");
		System.out.println(m_pwd);
		
		int result = 0;
		result = memberService.memberDelete(m_pwd);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("display", "../member/delete.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
}
