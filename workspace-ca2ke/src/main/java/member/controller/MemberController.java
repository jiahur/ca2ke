package member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;

import admin.controller.AdminService;
import member.bean.MemberDTO;
import member.dao.MemberDAO;





@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/main/myPage")
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/myPage.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/kakaoLogin", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code")String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		System.out.println("test1");
		System.out.println("code" + code);
		/*	
		 JsonNode token = KakaoLogin.getAccessToken(code);
			
		 System.out.println("test2");
		
		 JsonNode profile = KakaoLogin.getKakaoMemberInfo(token.path("access_token").toString());
		
		 
		 System.out.println(profile);
		
		 MemberDTO memberDTO = KakaoLogin.changeData(profile);
		
		 System.out.println("test3"); 
		
		 memberDTO.setM_id("kakao_"+memberDTO.getM_id());
		 
		 System.out.println(session);
		
		 
		 memberDTO = memberService.kakaoLogin(memberDTO.getM_id());
		 
		 System.out.println(memberDTO.toString());

		  if(memberDTO.getM_name() != null) {
			  System.out.println("데이터가져오기 성공!");
			  session.setAttribute("memId", memberDTO.getM_id());
			  session.setAttribute("memName", memberDTO.getM_name());		 
		  }else {
			  System.out.println("DTO에 값이 없음.");
		  }	  */
		  
		  return "kakaoLogin.jsp";
		
	}
	
	@RequestMapping(value="/main/joinForm")
	public ModelAndView memberJoinForm(HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
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
		String id = request.getParameter("m_id");
		String pwd = request.getParameter("m_pwd");
		String m_name = "";

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		if(id.contains("admin")) {
			m_name = adminService.adminLogin(id, pwd);
			if(m_name == null) {
				modelAndView.addObject("display", "adminlogin");
				modelAndView.setViewName("../main/main.jsp");
			}else {
				session.setAttribute("admin", id);
				session.setAttribute("memName", m_name);
				modelAndView.addObject("display", "adminlogin");
				modelAndView.setViewName("../main/main.jsp");
			}
			
		}else {
			m_name = memberService.login(id, pwd);
			if(m_name == null) {
				modelAndView.addObject("display", "../member/login.jsp");
				modelAndView.setViewName("../main/main.jsp");
			}else {
				session.setAttribute("memId", id);
				session.setAttribute("memName", m_name);
				modelAndView.addObject("display", "../member/login.jsp");
				modelAndView.setViewName("../main/main.jsp");
			}
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
		modelAndView.setViewName("../member/modifyViewForm.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/modifyEditCheckForm")
	public ModelAndView modifyEditCheckForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/modifyEditCheckForm.jsp");
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
		HttpSession session = request.getSession();
		String m_id =  (String) session.getAttribute("memId");
		String memPwd = memberService.pwdCheck(m_id);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("m_pwd", m_pwd);
			modelAndView.addObject("memPwd", memPwd);
			
			modelAndView.setViewName("../member/modifyEditCheck.jsp");

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
		modelAndView.setViewName("../member/modify.jsp");
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
		modelAndView.setViewName("../member/modifyEditOklogout.jsp");
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
		modelAndView.setViewName("../member/logOut.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/deleteForm")
	public ModelAndView deleteForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/deleteForm.jsp");
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
		modelAndView.setViewName("../member/delete.jsp");
		return modelAndView;
	}

	
	// 회원가입 이메일 인증
	@RequestMapping(value = "/main/authSend" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<Object, Object> checkDuplicate(HttpServletResponse response,  @RequestParam("m_email") String m_email, Model model)throws Exception {

		URLEncoder.encode(m_email, "UTF-8");
		System.out.println(m_email);
		boolean result = memberService.emailCheck(m_email);
		System.out.println(result);
		Map<Object, Object> map = new HashMap<Object, Object>();
		String authNum = "";
		

		EmailSend emailSend = new EmailSend();
		authNum = emailSend.RandomNum();
		System.out.println(authNum);
		String content = "인증번호 [" + authNum + "]";
		map.put("result", result);
		map.put("authNum", authNum);
		emailSend.sendmail(m_email, authNum,content);
		
			
		return map;
	}
	@RequestMapping(value="/main/emailCheckForm")
	public ModelAndView emailCheckForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/emailCheckForm.jsp");
		return modelAndView;
	}
    @RequestMapping(value="/main/findIdForm")
	public ModelAndView findIdFindForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/findIdForm.jsp");
		return modelAndView;
	}
    
    @RequestMapping(value="/main/findId")
	public ModelAndView findIdFind(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String m_email = request.getParameter("m_email");
    	String m_name = request.getParameter("m_name");
    	System.out.println(m_email);
    	System.out.println(m_name);
    	ModelAndView modelAndView = new ModelAndView();
    	
    	// authNum << 아이디찾기 에서 아이디값 받아온다 .. email메소드 재활용하기위해서 이렇게함..
    	String authNum = memberService.idFind(m_name, m_email);
    	System.out.println(authNum);
    	
    	if(authNum != null) {
    		EmailSend emailSend = new EmailSend();
    		String content = m_name +"님의 아이디는  = [" + authNum + "]입니다.";
    		emailSend.sendmail(m_email, authNum,content);
    		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findId.jsp");
    	}else {
    		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findId.jsp");
    	}

		return modelAndView;
	}
    
    @RequestMapping(value="/main/findPwForm")
	public ModelAndView findPwFindForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/findPwForm.jsp");
		return modelAndView;
	}
    @RequestMapping(value="/main/findPw")
  	public ModelAndView findPwFind(HttpServletRequest request, HttpServletResponse response) throws Exception {
      	String m_email = request.getParameter("m_email");
      	String m_id = request.getParameter("m_id");
      	ModelAndView modelAndView = new ModelAndView();
      	
      	
      	// authNum << 아이디찾기 에서 비밀번호받아온다 .. email메소드 재활용하기위해서 이렇게함..
      	String authNum = memberService.idFind(m_id, m_email);
      	
      	if(authNum != null) {
      		EmailSend emailSend = new EmailSend();
      		String content = "회원님의 비밀번호는  = [" + authNum + "]입니다.";
      		emailSend.sendmail(m_email, authNum,content);
      		
      		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findPw.jsp");
    	}else {
    		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findId.jsp");
    	}
  		
  		
  		return modelAndView;
  	}
	
 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
