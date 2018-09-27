package manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {
	@RequestMapping(value="/admin/managerAddForm")
	public ModelAndView managerAddForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tab", "admin_manager.jsp");
		modelAndView.addObject("display", "../manager/managerAddForm.jsp");
		modelAndView.setViewName("admin_main.jsp");
		return modelAndView;
	}
}
