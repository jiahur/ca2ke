package item.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import item.bean.ItemDTO;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value="/main/itemList")
	public ModelAndView itemList(HttpServletRequest request) {
		// 데이터
		int i_category = 1;
		String str_category = request.getParameter("category");
		if(str_category!=null) i_category = Integer.parseInt(str_category);
		
		
		ArrayList<ItemDTO> list = (ArrayList<ItemDTO>) itemService.itemList(i_category);
		int totalA = itemService.getTotalA(i_category);	// 총글수 (Total Article number)

		ModelAndView modelAndView = new ModelAndView();
		request.getSession().setAttribute("admin", 1);
		modelAndView.addObject("totalA", totalA);
		modelAndView.addObject("list", list);
		modelAndView.addObject("display", "../item/itemList.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/itemAddForm")
	public ModelAndView itemAddForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../item/itemAddForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/itemAdd")
	public ModelAndView itemAdd(ItemDTO itemDTO, MultipartFile img){
		
		String filePath="D:\\Final_Project\\workspace\\ca2ke\\src\\main\\webapp\\storage";//-- 각 컴퓨터에서 수정 필요
		                 
		String fileName = img.getOriginalFilename();

		File file = new File(filePath, fileName);
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		itemDTO.setItem_image(fileName);
				
		int result = itemService.itemAdd(itemDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("category", itemDTO.getI_category());
		modelAndView.addObject("result", result);
		//modelAndView.addObject("display", "../item/itemList?category="+itemDTO.getI_category());
		modelAndView.setViewName("../item/itemAdd.jsp");
		return modelAndView;
	}
	
	
}
