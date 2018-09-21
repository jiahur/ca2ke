package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;
import member.controller.MemberService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/main/adminlogin")
	public ModelAndView adminlogin(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../admin/adminLogin.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	//경로 테스트 /admin/ < 나중에 /main/변경
	@RequestMapping(value="/admin/adminJoinForm")
	public ModelAndView adminJoinForm() {
		ModelAndView modelAndView = new ModelAndView();
		//경로 테스트
		modelAndView.setViewName("adminJoinForm.jsp");
		/*modelAndView.addObject("display", "../admin/adminJoinForm.jsp");
		modelAndView.setViewName("../main/main.jsp");*/
		return modelAndView;
	}
	
	//경로 테스트 /admin/ < 나중에 /main/변경
	@RequestMapping(value="/admin/adminJoin")
	public ModelAndView adminJoin(HttpServletRequest request, HttpServletResponse response) {
		String a_id = request.getParameter("a_id");
		String a_pwd= request.getParameter("a_pwd");
		String a_name= request.getParameter("a_name");
		
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setA_id(a_id);
		adminDTO.setA_name(a_name);
		adminDTO.setA_pwd(a_pwd);
		int result = adminService.adminJoin(adminDTO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("adminDTO", adminDTO);
		/*modelAndView.addObject("display", "../admin/adminJoin.jsp");
		modelAndView.setViewName("../main/main.jsp");*/
		//경로테스트
		modelAndView.setViewName("adminJoin.jsp");
		
		return modelAndView;
	}
	
	//경로 테스트 /admin/ < 나중에 /main/변경
	@RequestMapping("/admin/adminjoinCheckId")
	@ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String a_id) {
	     
        Map<Object, Object> map = new HashMap<Object, Object>();
        
        boolean exist = adminService.adminIdCheck(a_id);
        map.put("exist", exist);
        
        return map;
    }
	
	@RequestMapping(value="/admin/adminList")
	public ModelAndView adminListForm(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = pg*5;
		int startNum = endNum-4;
		
		ArrayList<MemberDTO> list = (ArrayList<MemberDTO>)adminService.memberList(startNum, endNum);
		
		int totalA = adminService.getTotalA();	
		int totalP = (totalA+4) / 5;				

		int startPage = (pg-1)/3*3+1;	
		int endPage = startPage + 3 - 1;
		if(totalP < endPage) endPage = totalP;
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("pg",pg);
		modelAndView.addObject("totalP", totalP);
		modelAndView.setViewName("adminList.jsp");
		
		
		return modelAndView;
	}

}
