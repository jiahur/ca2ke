package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	   @RequestMapping(value="/admin/tab_member")
	   public ModelAndView tab_member() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_member.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_item")
	   public ModelAndView tab_item() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_item.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_order")
	   public ModelAndView tab_order() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_order.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_account")
	   public ModelAndView tab_account() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_account.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_manager")
	   public ModelAndView tab_manager() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_manager.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
}
